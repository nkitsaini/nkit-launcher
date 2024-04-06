import 'package:flutter/material.dart';

const icons = {
  // The key is important, this is what is stored in cache.
  // So basically icons can be changed if the key remains same.
  // And the app might crash if the cache has wrong key.
  // So entry shouldn't be removed from here.
  'photo_camera': Icons.photo_camera_outlined,
  'camera': Icons.camera_outlined,
  'call': Icons.call_outlined,
  'music': Icons.headset_outlined,
  'credit_card': Icons.credit_card_outlined,
  'payments': Icons.payments_outlined,
  'payment': Icons.payment_outlined,
  'wb_twilight': Icons.wb_twilight_outlined,
  'podcasts': Icons.podcasts_outlined,
  'fitbit': Icons.fitbit,
  'history_edu': Icons.history_edu_outlined,
  'sync': Icons.sync,
  'sync_alt': Icons.sync_alt,
  'map': Icons.map_outlined,
  'place': Icons.place_outlined,
  'web': Icons.web_outlined,
  'calendar_month': Icons.calendar_month_outlined,
  'calendar_today': Icons.calendar_today_outlined,
  'date_range': Icons.date_range_outlined,
  'calculate': Icons.calculate_outlined,
  'schedule': Icons.schedule_outlined,
  'folder': Icons.folder_outlined,
  'folder_open': Icons.folder_open_outlined,
  'folder_copy': Icons.folder_copy,
};

String? iconDataToName(IconData icon) {
  for (final (entry) in icons.entries) {
    if (entry.value == icon) {
      return entry.key;
    }
  }
  return null;
}
