import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

class ButtonLarge extends StatefulWidget {
  final String text;
  final Color color;
  final dynamic keyForm;
  final double fontsize;
  final dynamic page;
  final String action;

  const ButtonLarge({
    super.key,
    required this.text,
    required this.color,
    required this.keyForm,
    required this.fontsize,
    required this.page,
    required this.action,
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
        if (widget.keyForm != null && widget.keyForm.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: ColorConstants.greenLightAppColor,
              content: Text(widget.action),
            ),
          );
        }

        if (widget.page != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => widget.page,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: ColorConstants.greenLightAppColor,
              content: Text(widget.action),
            ),
          );
        }
      },
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
    );
  }
}
