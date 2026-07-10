import 'icon_choice.dart';
import 'packs/cupertino.dart';
import 'packs/font_awesome.dart';
import 'packs/line_awesome.dart';
import 'packs/material.dart';

/// All icons shipped by the launcher. Each entry uses a compile-time IconData
/// value, allowing Flutter to retain the glyphs while tree shaking fonts.
final List<IconChoice> searchableIcons = [
  ...allIcons.values,
  ...cupertinoIcons.values,
  ...fontAwesomeIcons.values,
  ...lineAwesomeIcons.values,
];

final Map<String, IconChoice> _iconsById = {
  for (final icon in searchableIcons) '${icon.pack}:${icon.name}': icon,
};

IconChoice? iconFromJson(Map<String, dynamic> json) {
  final pack = json['pack'];
  final key = json['key'];
  if (pack is! String || key is! String) {
    return null;
  }
  return _iconsById['$pack:$key'];
}
