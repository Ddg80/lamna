// Title Page
import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class NewVisonTitle extends StatelessWidget {
  const NewVisonTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          style: TextStyle(
              color: ColorConstants.greenDarkAppColor), //style for all textspan
          TextSpan(
            children: [
              TextSpan(
                text: "Une nouvelle vision ",
                style: TextStyle(
                    fontSize: 21.04,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: "du voyage alliant",
                style: TextStyle(
                  fontSize: 21.04,
                  color: ColorConstants.greenDarkAppColor,
                ),
              ),
              TextSpan(
                text: " commerce local ",
                style: TextStyle(
                    color: ColorConstants.yellowPrimaryAppColor,
                    fontSize: 21.04,
                    fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: " et ",
                style: TextStyle(
                    color: ColorConstants.greenDarkAppColor, fontSize: 21.04),
              ),
              TextSpan(
                text: "mobilité responsable",
                style: TextStyle(
                    fontSize: 21.04,
                    color: ColorConstants.yellowPrimaryAppColor,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
