import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class TextItineraryCounter extends StatelessWidget {
  const TextItineraryCounter({
    super.key,
    required int counter,
  }) : _counter = counter;

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: _counter > 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorConstants.greenDarkAppColor,
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "$_counter",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.greenDarkAppColor,
                          ),
                        ),
                        TextSpan(
                          text: " itinéraires sauvegardés",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.blackAppColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorConstants.greenDarkAppColor,
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "$_counter",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.greenDarkAppColor,
                          ),
                        ),
                        TextSpan(
                          text: " itinéraire sauvegardé",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.blackAppColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
