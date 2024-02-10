// Title Page
import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class TravelTitle extends StatelessWidget {
  const TravelTitle({
    Key? key,
    required this.text1,
    required this.text2,
    this.text3 = '',
  }) : super(key: key);

  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorConstants.greenDarkAppColor), //style for all textspan
          TextSpan(
            children: [
              TextSpan(
                text: text1,
                style: TextStyle(
                    fontSize: 30,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
              text3 != ''
                  ? TextSpan(
                      text: "des",
                      style: TextStyle(
                          fontSize: 30,
                          color: ColorConstants.greenDarkAppColor,
                          fontWeight: FontWeight.w400),
                    )
                  : const TextSpan(),
              TextSpan(
                text: text2,
                style: TextStyle(
                    color: ColorConstants.yellowPrimaryAppColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
