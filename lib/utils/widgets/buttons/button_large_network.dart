import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

class ButtonLargeNetwork extends StatelessWidget {
  const ButtonLargeNetwork(
      {super.key, required this.text, required this.image});

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.whiteAppColor,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  image,
                  width: 20,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: ColorConstants.blackAppColor,
                  fontSize: 16,
                  fontFamily: FontConstants.interExtraLightFont,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
