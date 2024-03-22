import 'package:flutter/material.dart';
import 'package:lamna/pages/reserved/destination_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';

class HaveNotTravel extends StatelessWidget {
  const HaveNotTravel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Vous n’avez aucun voyage de ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF5A5A5A),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            ' prévu pour le moment.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF5A5A5A),
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0.08,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: ButtonLarge(
              text: 'Réserver un voyage',
              color: ColorConstants.greenUltraDarkColor,
              fontsize: 12,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DestinationPage(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
