import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

class TitleItinerary extends StatelessWidget {
  const TitleItinerary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          textAlign: TextAlign.start,
          style: TextStyle(
              color: ColorConstants.greenDarkAppColor), //style for all textspan
          TextSpan(
            children: [
              TextSpan(
                text: "Itinéraires à découvrir à ",
                style: TextStyle(
                    fontSize: 21,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Container(
          transform: Matrix4.translationValues(-68, 0, 0),
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 14.0),
            child: Text(
              'Rennes',
              style: TextStyle(
                color: ColorConstants.greenDarkAppColor,
                fontSize: 30,
                fontFamily: FontConstants.regularFont,
                fontWeight: FontWeight.w600,
                height: 0.04,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
