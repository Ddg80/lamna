import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

List<Widget> indicators(currentIndex) {
  return List<Widget>.generate(3, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: currentIndex == index ? 50 : 20,
      height: 10,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? ColorConstants.greenDarkAppColor
            : Colors.black26,
        shape: currentIndex == index ? BoxShape.rectangle : BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
    );
  });
}
