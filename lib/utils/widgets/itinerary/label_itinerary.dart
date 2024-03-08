import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

class LabelItinerary extends StatelessWidget {
  const LabelItinerary({
    super.key,
    this.indicator,
    this.distance,
    required this.content,
    required this.icon,
  });

  final int? indicator;
  final double? distance;
  final String content;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1.0),
      child: Container(
        width: MediaQuery.of(context).size.width * .21,
        decoration: ShapeDecoration(
          color: ColorConstants.whiteAppColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(
                width: 3,
              ),
              Row(
                children: [
                  Text(
                    distance != null
                        ? distance.toString()
                        : indicator.toString(),
                    style: TextStyle(
                      color: ColorConstants.blackAppColor,
                      fontFamily: FontConstants.interBoldFont,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      color: ColorConstants.blackAppColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
