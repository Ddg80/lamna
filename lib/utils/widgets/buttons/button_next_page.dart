import 'package:flutter/material.dart';

class ButtonNextPage extends StatefulWidget {
  final Widget child;
  final GestureTapCallback onPressed;
  final Color color;

  const ButtonNextPage(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.color});

  @override
  State<ButtonNextPage> createState() => _ButtonNextPageState();
}

class _ButtonNextPageState extends State<ButtonNextPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        // side: BorderSide(color: Colors.yellow, width: 5),
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
      child: widget.child,
    );
  }
}
