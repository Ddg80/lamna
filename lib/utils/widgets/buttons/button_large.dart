import 'package:flutter/material.dart';
import 'package:lamna/pages/home_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class ButtonLarge extends StatelessWidget {
  const ButtonLarge(
      {Key? key,
      required this.text,
      required this.color,
      required this.keyForm})
      : super(key: key);

  final String text;
  final Color color;
  final dynamic keyForm;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        if (keyForm.currentState!.validate()) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const HomePage(),
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
                text,
                style: TextStyle(
                  color: ColorConstants.blackAppColor,
                  fontSize: 20,
                  fontFamily: 'Clash Display Variable',
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
