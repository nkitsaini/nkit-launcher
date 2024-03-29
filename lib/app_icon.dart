import 'package:flutter/material.dart';

const icons = {
  'photo_camera': Icons.photo_camera_outlined,
  'camera': Icons.camera_outlined,
  'call': Icons.call_outlined,
  'music': Icons.headset_outlined,
  'credit_card': Icons.credit_card_outlined,
  'wb_twilight': Icons.wb_twilight_outlined,
  'podcasts': Icons.podcasts_outlined,
};

String? iconDataToName(IconData icon) {
  for (final (entry) in icons.entries) {
    if (entry.value == icon) {
      return entry.key;
    }
  }
  return null;
}
