// Button Next Page
import 'package:flutter/material.dart';
import 'package:lamna/utils/widgets/buttons/button_next_page.dart';

class ButtonNextPageNewVison extends StatelessWidget {
  const ButtonNextPageNewVison({
    Key? key,
    required BuildContext context,
    required this.page,
    required this.title,
    required this.color,
    required this.icon,
  }) : super(key: key);

  final String title;
  final dynamic page;
  final Color color;
  final IconData icon;

  void _navigate(context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonNextPage(
      onPressed: () {
        _navigate(context, page);
      },
      color: color,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Clash Display Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  icon,
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
