import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class InfoToast extends StatelessWidget {
  const InfoToast({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ColorConstants.greenDarkAppColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check, color: Colors.white),
          const SizedBox(
            width: 12.0,
          ),
          Text(message, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
