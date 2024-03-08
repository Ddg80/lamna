import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

Widget titleItineraries(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          textAlign: TextAlign.start,
          style: TextStyle(
              color: ColorConstants.greenDarkAppColor), //style for all textspan
          TextSpan(
            children: [
              TextSpan(
                text: "Itinéraires à ",
                style: TextStyle(
                    fontSize: 24,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: "Rennes ",
                style: TextStyle(
                    fontSize: 24,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        Text(
          "Parcourez Rennes à travers nos itinéraires, ",
          style: TextStyle(
            fontSize: 16,
            fontFamily: FontConstants.interRegularFont,
          ),
        ),
        Text(
          'révélant ses secrets et son charme.',
          style: TextStyle(
            fontSize: 16,
            fontFamily: FontConstants.interRegularFont,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ),
  );
}
