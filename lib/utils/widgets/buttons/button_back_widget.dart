import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class ButtonBackWidget extends StatelessWidget {
  const ButtonBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstants.greenBlurSecondaryColor.withOpacity(.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: ColorConstants.greenDarkAppColor,
          ),
        ),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
