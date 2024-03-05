import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

Widget titleCollaboration(BuildContext context) {
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
                text: "Offre d' ",
                style: TextStyle(
                    fontSize: 25,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: "abonnements   ",
                style: TextStyle(
                    fontSize: 25,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
