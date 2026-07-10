import 'package:flutter/widgets.dart';

/// A selectable icon with a stable identifier for persistence.
class IconChoice {
  const IconChoice({
    required this.name,
    required this.data,
    required this.pack,
  });

  final String name;
  final IconData data;
  final String pack;

  Map<String, dynamic> toJson() => {'pack': pack, 'key': name};
}
