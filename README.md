# nkit_launcher

A new Flutter project.

## Releasing

From a clean, checked-out release branch, run:

```sh
python3 scripts/release.py --patch
```

The script updates `pubspec.yaml`, commits the change, pushes the current branch,
then creates and pushes the annotated `v0.0.5` tag. Pushing the tag starts the
APK release workflow. Pass an explicit version (for example `0.0.5`) when
needed, or use `--patch`, `--minor`, or `--major` to calculate it from the
current version. With no version or increment flag, the script interactively
shows all three resulting versions and asks which increment to use. Use
`--dry-run` to validate the release inputs first.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
