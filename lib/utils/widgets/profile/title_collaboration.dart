import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

Widget titleCollaboration(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        transform: Matrix4.translationValues(-18, 0, 0),
        child: Text.rich(
          textAlign: TextAlign.start,
          style: TextStyle(
              color: ColorConstants.greenDarkAppColor), //style for all textspan
          TextSpan(
            children: [
              TextSpan(
                text: "Débloquez des ",
                style: TextStyle(
                    fontSize: 25,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        transform: Matrix4.translationValues(-18, 0, 0),
        child: Text(
          "promotions exclusives   ",
          style: TextStyle(
              fontSize: 25,
              color: ColorConstants.greenDarkAppColor,
              fontWeight: FontWeight.w800),
        ),
      ),
    ],
  );
}
