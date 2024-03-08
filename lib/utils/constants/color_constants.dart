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
  static final Color lightScaffoldBackgroundColor = hexToColor('#FFFAE9');
  static final Color greenLightAppColor = hexToColor('#69B483');
  static final Color greenDarkAppColor = hexToColor('#3B6B4F');
  static final Color greenUltraDarkColor = hexToColor('#3C674C');
  static final Color yellowPrimaryAppColor = hexToColor('#FDA92B');
  static final Color yellowSecondaryAppColor = hexToColor('#FDC22B');
  static final Color redDarkAppColor = hexToColor('#ED755B');
  static final Color whiteAppColor = hexToColor('#FFFFFF');
  static final Color blackAppColor = hexToColor('#000000');
  static final Color greyAppColor = hexToColor('#C2C2C2');
  static final Color redBlurSecondaryColor = hexToColor('#E3ADAD');
  static final Color greenBlurSecondaryColor = hexToColor('#B6E3AD');
  static final Color cardBgColor = hexToColor('#090942');
  static final Color cardBgLightColor = hexToColor('#000000');
  static final Color colorB58D67 = hexToColor('#B58D67');
  static final Color colorE5D1B2 = hexToColor('#E5D1B2');
  static final Color colorF9EED2 = hexToColor('#F9EED2');
  static final Color colorEFEFED = hexToColor('#EFEFED');
}
