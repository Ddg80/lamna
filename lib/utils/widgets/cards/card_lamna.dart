import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

class CardLamna extends StatefulWidget {
  final double statistic;
  final String? unity;
  final String title;
  final String? subtitle;
  final String label;
  final String? sublabel;
  final double? height;

  const CardLamna({
    super.key,
    required this.statistic,
    this.unity,
    required this.title,
    required this.label,
    this.subtitle = "",
    this.sublabel = "",
    this.height,
  });

  @override
  State<CardLamna> createState() => _CardLamnaState();
}

class _CardLamnaState extends State<CardLamna> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: 138,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 24,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.statistic.toString()} ",
                style: TextStyle(
                  color: ColorConstants.yellowPrimaryAppColor,
                  fontSize: 25,
                  fontFamily: FontConstants.semiBoldFont,
                  fontWeight: FontWeight.w500,
                  height: 0.04,
                ),
              ),
              widget.unity != null
                  ? Text(
                      widget.unity!,
                      style: TextStyle(
                        color: ColorConstants.yellowPrimaryAppColor,
                        fontSize: 25,
                        fontFamily: FontConstants.regularFont,
                        fontWeight: FontWeight.w700,
                        height: 0.04,
                      ),
                    )
                  : Container(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                widget.title,
                style: TextStyle(
                  color: ColorConstants.blackAppColor,
                  fontSize: 14,
                  fontFamily: FontConstants.regularFont,
                  fontWeight: FontWeight.w700,
                  height: 0.04,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  widget.subtitle!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstants.blackAppColor,
                    fontSize: 14,
                    fontFamily: FontConstants.regularFont,
                    fontWeight: FontWeight.w700,
                    height: 0.04,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .35,
                height: 35,
                decoration: ShapeDecoration(
                  color: ColorConstants.greenBlurSecondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31),
                  ),
                ),
                child: Center(
                  child: widget.sublabel != ""
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.label,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorConstants.blackAppColor,
                                fontSize: 11,
                                fontFamily: FontConstants.regularFont,
                                fontWeight: FontWeight.w700,
                                height: 0.04,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Text(
                                widget.sublabel!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.blackAppColor,
                                  fontSize: 11,
                                  fontFamily: FontConstants.regularFont,
                                  fontWeight: FontWeight.w700,
                                  height: 0.04,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.label,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorConstants.blackAppColor,
                                fontSize: 11,
                                fontFamily: FontConstants.regularFont,
                                fontWeight: FontWeight.w700,
                                height: 0.04,
                              ),
                            ),
                          ],
                        ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
