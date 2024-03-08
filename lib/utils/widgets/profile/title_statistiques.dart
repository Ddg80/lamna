import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

Widget titleStatistiques(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        transform: Matrix4.translationValues(-18, 0, 0),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Statistiques   ",
                    style: TextStyle(
                      fontSize: 25,
                      color: ColorConstants.greenDarkAppColor,
                      fontFamily: FontConstants.principalFont,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "de vos ",
                    style: TextStyle(
                      fontSize: 25,
                      color: ColorConstants.greenDarkAppColor,
                      fontFamily: FontConstants.regularFont,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                "voyages ",
                style: TextStyle(
                  fontSize: 25,
                  color: ColorConstants.greenDarkAppColor,
                  fontFamily: FontConstants.regularFont,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}



 
      //   Text.rich(
      //     textAlign: TextAlign.start,
      //     style: TextStyle(
      //         color: ColorConstants.greenDarkAppColor), //style for all textspan
      //     TextSpan(
      //       children: [
      //         TextSpan(
      //           text: "Statistiques ",
      //           style: TextStyle(
      //             fontSize: 25,
      //             color: ColorConstants.greenDarkAppColor,
      //             fontWeight: FontWeight.w400,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // Container(
      //   transform: Matrix4.translationValues(-18, 0, 0),
      //   child: Text(
      //     "promotions exclusives   ",
      //     style: TextStyle(
      //         fontSize: 25,
      //         color: ColorConstants.greenDarkAppColor,
      //         fontWeight: FontWeight.w800),
      //   ),
      // ),