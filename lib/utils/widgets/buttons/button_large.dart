import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

class ButtonLarge extends StatefulWidget {
  final String text;
  final Color color;
  final double fontsize;
  final GestureTapCallback onPressed;

  const ButtonLarge({
    super.key,
    required this.text,
    required this.color,
    required this.fontsize,
    required this.onPressed,
  });

  @override
  State<ButtonLarge> createState() => _ButtonLargeState();
}

class _ButtonLargeState extends State<ButtonLarge> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
      child: SizedBox(
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: ColorConstants.lightScaffoldBackgroundColor,
                    fontSize: widget.fontsize,
                    fontFamily: FontConstants.mediumFont,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Icon(
                  Icons.east,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
