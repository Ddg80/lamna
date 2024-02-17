import 'package:flutter/material.dart';

class BlockHavetrip extends StatelessWidget {
  const BlockHavetrip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/miniCardsItineraries/route1S.png',
      width: MediaQuery.of(context).size.width * .9,
    );
  }
}
