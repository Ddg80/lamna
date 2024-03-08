import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class CardOptions extends StatelessWidget {
  const CardOptions({
    super.key,
    required this.textPart1,
    required this.textPart2,
    required this.image,
    required this.onTap,
  });

  final String textPart1;
  final String textPart2;
  final String image;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 195,
      decoration: ShapeDecoration(
        color: ColorConstants.whiteAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: 145,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: textPart1,
                      style: TextStyle(
                        color: ColorConstants.greenDarkAppColor,
                        fontSize: 18,
                        fontFamily: 'Clash Display Variable',
                        fontWeight: FontWeight.w400,
                        height: 0.07,
                      ),
                    ),
                    TextSpan(
                      text: textPart2,
                      style: TextStyle(
                        color: ColorConstants.greenDarkAppColor,
                        fontSize: 18,
                        fontFamily: 'Clash Display Variable',
                        fontWeight: FontWeight.w600,
                        height: 0.07,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: SvgPicture.asset(
              image,
              width: 150,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                onTap();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorConstants.greenDarkAppColor,
                  ),
                  child: const Icon(
                    Icons.east,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
