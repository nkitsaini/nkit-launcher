package com.example.nkit_launcher

import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.LauncherApps
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.ColorMatrix
import android.graphics.ColorMatrixColorFilter
import android.graphics.Paint
import android.graphics.drawable.Drawable
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Process
import android.os.UserHandle
import android.os.UserManager
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.io.File

class MainActivity : FlutterActivity() {
    private val methodChannelName = "nkit_launcher/launcher"
    private val eventChannelName = "nkit_launcher/apps_changed"
    private var pendingFileResult: MethodChannel.Result? = null
    private var pendingSaveContent: String? = null
    private var pendingFileMimeType: String? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            methodChannelName
        ).setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    "getEntries" -> result.success(getLauncherEntries())
                    "getEntryIcon" -> {
                        @Suppress("UNCHECKED_CAST")
                        result.success(entryIcon(call.arguments as Map<String, Any?>))
                    }
                    "openEntry" -> {
                        @Suppress("UNCHECKED_CAST")
                        openEntry(call.arguments as Map<String, Any?>)
                        result.success(null)
                    }
                    "openAppSettings" -> {
                        @Suppress("UNCHECKED_CAST")
                        val args = call.arguments as Map<String, Any?>
                        openAppSettings(args["packageName"] as String)
                        result.success(null)
                    }
                    "uninstallPackage" -> {
                        @Suppress("UNCHECKED_CAST")
                        val args = call.arguments as Map<String, Any?>
                        uninstallPackage(args["packageName"] as String)
                        result.success(null)
                    }
                    "pickFile" -> {
                        @Suppress("UNCHECKED_CAST")
                        val args = call.arguments as Map<String, Any?>
                        pickFile(args["mimeType"] as? String ?: "*/*", result)
                    }
                    "saveTextFile" -> {
                        @Suppress("UNCHECKED_CAST")
                        val args = call.arguments as Map<String, Any?>
                        saveTextFile(
                            args["fileName"] as String,
                            args["content"] as String,
                            args["mimeType"] as? String ?: "text/plain",
                            result
                        )
                    }
                    else -> result.notImplemented()
                }
            } catch (error: Exception) {
                result.error("launcher_error", error.message, null)
            }
        }

        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            eventChannelName
        ).setStreamHandler(AppChangeStreamHandler(this))
    }

    private fun getLauncherEntries(): List<Map<String, Any?>> {
        val launcherApps = getSystemService(LauncherApps::class.java)
        val entries = mutableListOf<Map<String, Any?>>()

        for (user in userProfiles()) {
            for (activity in launcherApps.getActivityList(null, user)) {
                val component = activity.componentName
                entries.add(
                    mapOf(
                        "id" to activityId(component, user),
                        "title" to activity.label.toString(),
                        "packageName" to component.packageName,
                        "activityName" to component.className,
                        "shortcutId" to null,
                        "userHash" to user.hashCode(),
                        "versionName" to packageVersion(component.packageName),
                        "type" to "activity"
                    )
                )
            }

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N_MR1) {
                val query = LauncherApps.ShortcutQuery().apply {
                    setQueryFlags(
                        LauncherApps.ShortcutQuery.FLAG_MATCH_DYNAMIC or
                            LauncherApps.ShortcutQuery.FLAG_MATCH_MANIFEST or
                            LauncherApps.ShortcutQuery.FLAG_MATCH_PINNED
                    )
                }
                val shortcuts = try {
                    launcherApps.getShortcuts(query, user).orEmpty()
                } catch (_: Exception) {
                    emptyList()
                }

                for (shortcut in shortcuts) {
                    if (!shortcut.isEnabled) {
                        continue
                    }
                    val packageName = shortcut.`package`
                    val shortcutId = shortcut.id
                    val title = shortcut.longLabel?.toString()
                        ?: shortcut.shortLabel?.toString()
                        ?: packageName
                    entries.add(
                        mapOf(
                            "id" to shortcutEntryId(packageName, shortcutId, user),
                            "title" to title,
                            "packageName" to packageName,
                            "activityName" to shortcut.activity?.className,
                            "shortcutId" to shortcutId,
                            "userHash" to user.hashCode(),
                            "versionName" to packageVersion(packageName),
                            "type" to "shortcut"
                        )
                    )
                }
            }
        }

        return entries
            .distinctBy { it["id"] as String }
            .sortedBy { (it["title"] as String).lowercase() }
    }

    private fun packageVersion(packageName: String): String? = try {
        @Suppress("DEPRECATION")
        packageManager.getPackageInfo(packageName, 0).versionName
    } catch (_: Exception) {
        null
    }

    private fun entryIcon(entry: Map<String, Any?>): ByteArray? {
        val packageName = entry["packageName"] as String
        val user = findUser(entry["userHash"] as? Int)
        val launcherApps = getSystemService(LauncherApps::class.java)
        val drawable = try {
            launcherApps.getApplicationInfo(packageName, 0, user).loadIcon(packageManager)
        } catch (_: Exception) {
            try {
                packageManager.getApplicationIcon(packageName)
            } catch (_: Exception) {
                null
            }
        } ?: return null
        return grayscalePng(drawable)
    }

    private fun grayscalePng(drawable: Drawable): ByteArray {
        val size = 96
        val source = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888)
        Canvas(source).apply {
            drawable.setBounds(0, 0, size, size)
            drawable.draw(this)
        }
        val grayscale = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888)
        val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            colorFilter = ColorMatrixColorFilter(ColorMatrix().apply { setSaturation(0f) })
        }
        Canvas(grayscale).drawBitmap(source, 0f, 0f, paint)
        return ByteArrayOutputStream().use { output ->
            grayscale.compress(Bitmap.CompressFormat.PNG, 100, output)
            output.toByteArray()
        }
    }

    private fun openEntry(entry: Map<String, Any?>) {
        val packageName = entry["packageName"] as String
        val user = findUser(entry["userHash"] as? Int)
        val launcherApps = getSystemService(LauncherApps::class.java)

        if (entry["type"] == "shortcut" && Build.VERSION.SDK_INT >= Build.VERSION_CODES.N_MR1) {
            val shortcutId = entry["shortcutId"] as String
            launcherApps.startShortcut(packageName, shortcutId, null, null, user)
            return
        }

        val activityName = entry["activityName"] as? String
        if (activityName != null) {
            launcherApps.startMainActivity(
                ComponentName(packageName, activityName),
                user,
                null,
                null
            )
            return
        }

        val intent = packageManager.getLaunchIntentForPackage(packageName)
            ?: throw IllegalArgumentException("No launch intent for $packageName")
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        startActivity(intent)
    }

    private fun pickFile(mimeType: String, result: MethodChannel.Result) {
        if (pendingFileResult != null) {
            result.error("file_picker_busy", "Another file request is active", null)
            return
        }
        pendingFileResult = result
        pendingFileMimeType = mimeType
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
            addCategory(Intent.CATEGORY_OPENABLE)
            type = mimeType
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
        startActivityForResult(intent, pickFileRequestCode)
    }

    private fun saveTextFile(
        fileName: String,
        content: String,
        mimeType: String,
        result: MethodChannel.Result
    ) {
        if (pendingFileResult != null) {
            result.error("file_picker_busy", "Another file request is active", null)
            return
        }
        pendingFileResult = result
        pendingSaveContent = content
        val intent = Intent(Intent.ACTION_CREATE_DOCUMENT).apply {
            addCategory(Intent.CATEGORY_OPENABLE)
            type = mimeType
            putExtra(Intent.EXTRA_TITLE, fileName)
        }
        startActivityForResult(intent, saveTextFileRequestCode)
    }

    @Deprecated("Deprecated in Android, but still supported for document intents.")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        when (requestCode) {
            pickFileRequestCode -> finishPickFile(resultCode, data)
            saveTextFileRequestCode -> finishSaveTextFile(resultCode, data)
        }
    }

    private fun finishPickFile(resultCode: Int, data: Intent?) {
        val result = pendingFileResult ?: return
        pendingFileResult = null
        val mimeType = pendingFileMimeType
        pendingFileMimeType = null
        if (resultCode != RESULT_OK || data?.data == null) {
            result.success(null)
            return
        }

        val uri = data.data!!
        if (mimeType?.startsWith("image/") != true) {
            try {
                val file = copyPickedFile(uri)
                result.success(file.absolutePath)
            } catch (error: Exception) {
                result.error("pick_file_failed", error.message, null)
            }
            return
        }

        // Bitmap decoding and PNG compression can take several seconds. Do it
        // away from the Android UI thread so Flutter can keep its progress UI
        // responsive until the result is delivered on the main thread.
        Thread {
            try {
                val file = prepareWallpaper(uri)
                runOnUiThread { result.success(file.absolutePath) }
            } catch (error: Exception) {
                runOnUiThread {
                    result.error("pick_file_failed", error.message, null)
                }
            }
        }.start()
    }

    private fun copyPickedFile(uri: Uri): File {
        val file = File(cacheDir, "picked_${System.currentTimeMillis()}")
        contentResolver.openInputStream(uri).use { input ->
            file.outputStream().use { output ->
                requireNotNull(input).copyTo(output)
            }
        }
        return file
    }

    /**
     * Stores a moderately sized, uncropped PNG for Flutter's wallpaper editor.
     * Keeping the full composition is necessary for user-selected crop framing.
     */
    private fun prepareWallpaper(uri: Uri): File {
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        contentResolver.openInputStream(uri).use { input ->
            BitmapFactory.decodeStream(input, null, bounds)
        }
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0) {
            return copyPickedFile(uri)
        }

        val display = resources.displayMetrics
        val coverScale = maxOf(
            display.widthPixels.toFloat() / bounds.outWidth,
            display.heightPixels.toFloat() / bounds.outHeight
        )
        // Retain enough detail for a modest zoom, while bounding very large
        // panoramas so selecting a wallpaper cannot exhaust memory.
        val scale = minOf(
            coverScale * 2,
            1f,
            4096f / maxOf(bounds.outWidth, bounds.outHeight)
        )
        val targetWidth = (bounds.outWidth * scale).toInt().coerceAtLeast(1)
        val targetHeight = (bounds.outHeight * scale).toInt().coerceAtLeast(1)
        var sampleSize = 1
        while (
            bounds.outWidth / (sampleSize * 2) >= targetWidth &&
            bounds.outHeight / (sampleSize * 2) >= targetHeight
        ) {
            sampleSize *= 2
        }
        val decodeOptions = BitmapFactory.Options().apply {
            inSampleSize = sampleSize
            inPreferredConfig = Bitmap.Config.ARGB_8888
        }
        val decoded = contentResolver.openInputStream(uri).use { input ->
            BitmapFactory.decodeStream(input, null, decodeOptions)
        } ?: return copyPickedFile(uri)
        val displayWidth = display.widthPixels.coerceAtLeast(1)
        val displayHeight = display.heightPixels.coerceAtLeast(1)
        val outputScale = minOf(
            targetWidth.toFloat() / decoded.width,
            targetHeight.toFloat() / decoded.height,
            1f
        )
        val outputWidth = (decoded.width * outputScale).toInt().coerceAtLeast(1)
        val outputHeight = (decoded.height * outputScale).toInt().coerceAtLeast(1)
        val resized = if (
            decoded.width == outputWidth && decoded.height == outputHeight
        ) {
            decoded
        } else {
            Bitmap.createScaledBitmap(decoded, outputWidth, outputHeight, true)
        }
        if (resized !== decoded) {
            decoded.recycle()
        }
        val wallpaperDirectory = File(filesDir, "wallpapers").apply { mkdirs() }
        val wallpaper = File(wallpaperDirectory, "wallpaper_${System.currentTimeMillis()}.png")
        wallpaper.outputStream().use { output ->
            resized.compress(Bitmap.CompressFormat.PNG, 100, output)
        }
        resized.recycle()
        return wallpaper
    }

    private fun finishSaveTextFile(resultCode: Int, data: Intent?) {
        val result = pendingFileResult ?: return
        val content = pendingSaveContent
        pendingFileResult = null
        pendingSaveContent = null

        if (resultCode != RESULT_OK || data?.data == null || content == null) {
            result.success(false)
            return
        }

        try {
            contentResolver.openOutputStream(data.data!!).use { output ->
                requireNotNull(output).write(content.toByteArray(Charsets.UTF_8))
            }
            result.success(true)
        } catch (error: Exception) {
            result.error("save_file_failed", error.message, null)
        }
    }

    private fun openAppSettings(packageName: String) {
        val intent = Intent(
            Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
            Uri.parse("package:$packageName")
        ).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        startActivity(intent)
    }

    private fun uninstallPackage(packageName: String) {
        startActivity(
            Intent(Intent.ACTION_UNINSTALL_PACKAGE, Uri.parse("package:$packageName"))
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        )
    }

    private fun userProfiles(): List<UserHandle> {
        val userManager = getSystemService(UserManager::class.java)
        return userManager?.userProfiles ?: listOf(Process.myUserHandle())
    }

    private fun findUser(userHash: Int?): UserHandle {
        return userProfiles().firstOrNull { it.hashCode() == userHash }
            ?: Process.myUserHandle()
    }

    private fun activityId(component: ComponentName, user: UserHandle): String {
        return "activity:${component.packageName}/${component.className}:${user.hashCode()}"
    }

    private fun shortcutEntryId(
        packageName: String,
        shortcutId: String,
        user: UserHandle
    ): String {
        return "shortcut:$packageName:$shortcutId:${user.hashCode()}"
    }

    companion object {
        private const val pickFileRequestCode = 6101
        private const val saveTextFileRequestCode = 6102
    }

    private class AppChangeStreamHandler(
        private val context: Context
    ) : EventChannel.StreamHandler {
        private var receiver: BroadcastReceiver? = null

        override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
            if (events == null || receiver != null) {
                return
            }

            receiver = object : BroadcastReceiver() {
                override fun onReceive(context: Context?, intent: Intent?) {
                    events.success(intent?.action)
                }
            }

            val filter = IntentFilter().apply {
                addAction(Intent.ACTION_PACKAGE_ADDED)
                addAction(Intent.ACTION_PACKAGE_CHANGED)
                addAction(Intent.ACTION_PACKAGE_REMOVED)
                addAction(Intent.ACTION_PACKAGE_REPLACED)
                addAction(Intent.ACTION_EXTERNAL_APPLICATIONS_AVAILABLE)
                addAction(Intent.ACTION_EXTERNAL_APPLICATIONS_UNAVAILABLE)
                addDataScheme("package")
            }

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                context.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED)
            } else {
                @Suppress("DEPRECATION")
                context.registerReceiver(receiver, filter)
            }
        }

        override fun onCancel(arguments: Any?) {
            receiver?.let(context::unregisterReceiver)
            receiver = null
        }
    }
}
