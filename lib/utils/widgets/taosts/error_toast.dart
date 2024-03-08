import 'package:flutter/material.dart';

class ErrorToast extends StatelessWidget {
  const ErrorToast({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.dangerous, color: Colors.white),
          const SizedBox(
            width: 12.0,
          ),
          Text(message, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
