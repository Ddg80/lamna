import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class LamnaLogo extends StatelessWidget {
  const LamnaLogo({super.key, required BuildContext context});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/logos/darkIconTypo.svg',
          width: 200,
        ),
        const SizedBox(
          height: 12.0,
        ),
        SizedBox(
          width: 200,
          child: LinearProgressIndicator(
            color: ColorConstants.greenDarkAppColor,
            minHeight: 4.0,
          ),
        ),
      ],
    );
  }
}
