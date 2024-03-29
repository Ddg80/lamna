import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

class TitleOptionsTransport extends StatelessWidget {
  const TitleOptionsTransport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          transform: Matrix4.translationValues(-28, 0, 0),
          child: Text.rich(
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstants.greenDarkAppColor,
            ),
            TextSpan(
              children: [
                TextSpan(
                  text: "Choississez",
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorConstants.greenDarkAppColor,
                    fontFamily: FontConstants.semiBoldFont,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: " parmi les moyens ",
                  style: TextStyle(
                    fontSize: 19,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          transform: Matrix4.translationValues(-38, 0, 0),
          child: Text(
            'de transport responsable',
            style: TextStyle(
              color: ColorConstants.greenDarkAppColor,
              fontSize: 20,
              fontFamily: FontConstants.regularFont,
            ),
          ),
        ),
      ],
    );
  }
}
