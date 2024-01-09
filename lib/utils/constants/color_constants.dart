import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color lightScaffoldBackgroundColor = hexToColor('#FFFAE9');
  static Color greenLightAppColor = hexToColor('#69B483');
  static Color greenDarkAppColor = hexToColor('#3B6B4F');
  static Color yellowPrimaryAppColor = hexToColor('#FDA92B');
  static Color yellowSecondaryAppColor = hexToColor('#FDC22B');
  static Color redDarkAppColor = hexToColor('#ED755B');
  static Color whiteAppColor = Colors.white;
  static Color blackAppColor = Colors.black;
  static Color greyAppColor = hexToColor('#C2C2C2');
}
