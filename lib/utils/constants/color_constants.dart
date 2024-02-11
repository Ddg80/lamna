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
  static Color greenUltraDarkColor = hexToColor('#3C674C');
  static Color yellowPrimaryAppColor = hexToColor('#FDA92B');
  static Color yellowSecondaryAppColor = hexToColor('#FDC22B');
  static Color redDarkAppColor = hexToColor('#ED755B');
  static Color whiteAppColor = hexToColor('#FFFFFF');
  static Color blackAppColor = hexToColor('#000000');
  static Color greyAppColor = hexToColor('#C2C2C2');
  static Color redBlurSecondaryColor = hexToColor('#E3ADAD');
  static Color greenBlurSecondaryColor = hexToColor('#B6E3AD');
  static Color cardBgColor = hexToColor('#090942');
  static Color cardBgLightColor = hexToColor('#000000');
  static Color colorB58D67 = hexToColor('#B58D67');
  static Color colorE5D1B2 = hexToColor('#E5D1B2');
  static Color colorF9EED2 = hexToColor('#F9EED2');
  static Color colorEFEFED = hexToColor('#EFEFED');
}
