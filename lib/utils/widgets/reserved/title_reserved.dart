import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

class TitleReserved extends StatelessWidget {
  const TitleReserved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          textAlign: TextAlign.start,
          style: TextStyle(
            color: ColorConstants.greenDarkAppColor,
          ), //style for all textspan
          TextSpan(
            children: [
              TextSpan(
                text: "Réserver ",
                style: TextStyle(
                  fontSize: 23,
                  color: ColorConstants.greenDarkAppColor,
                  fontFamily: FontConstants.semiBoldFont,
                ),
              ),
              TextSpan(
                text: "un moyen",
                style: TextStyle(
                    fontSize: 21,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontConstants.regularFont),
              )
            ],
          ),
        ),
        Container(
          transform: Matrix4.translationValues(22, 0, 0),
          child: Text(
            'de transport responsable',
            style: TextStyle(
              color: ColorConstants.greenDarkAppColor,
              fontSize: 21,
              fontFamily: FontConstants.regularFont,
            ),
          ),
        ),
      ],
    );
  }
}
