import 'package:flutter/material.dart';
import 'package:lamna/pages/auth/register_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/indicators.dart';

class IndicatorsSliders extends StatelessWidget {
  const IndicatorsSliders({
    super.key,
    required this.indexPageActive,
  });

  final int indexPageActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(indexPageActive),
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ),
          ),
          child: Text(
            'Passer',
            style: TextStyle(color: ColorConstants.blackAppColor),
          ),
        ),
      ],
    );
  }
}
