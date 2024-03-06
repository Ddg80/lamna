import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamna/pages/auth/login_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

class CardLamnaLarge extends StatefulWidget {
  final int id;
  final String pictureSVG;
  final String title;
  final String subtitle;

  const CardLamnaLarge({
    super.key,
    required this.id,
    required this.pictureSVG,
    required this.title,
    required this.subtitle,
  });

  @override
  State<CardLamnaLarge> createState() => _CardLamnaLargeState();
}

class _CardLamnaLargeState extends State<CardLamnaLarge> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.id == 6) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: 80,
        decoration: ShapeDecoration(
          color: ColorConstants.whiteAppColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorConstants.greyAppColor.withOpacity(.5),
            ),
            borderRadius: BorderRadius.circular(31),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(widget.pictureSVG),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontFamily: FontConstants.principalFont,
                        color: ColorConstants.greenDarkAppColor,
                      ),
                    ),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontFamily: FontConstants.interRegularFont,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
