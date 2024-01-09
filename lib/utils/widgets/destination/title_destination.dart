import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

Widget titleDestination(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          textAlign: TextAlign.start,
          style: TextStyle(
              color: ColorConstants.greenDarkAppColor), //style for all textspan
          TextSpan(
            children: [
              TextSpan(
                text: "Choisissez la ",
                style: TextStyle(
                    fontSize: 21,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: "destination ",
                style: TextStyle(
                    fontSize: 21,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        Container(
          transform: Matrix4.translationValues(-35, 0, 0),
          child: Text(
            "de votre voyage... ",
            style: TextStyle(
                color: ColorConstants.greenDarkAppColor,
                fontSize: 21,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}
