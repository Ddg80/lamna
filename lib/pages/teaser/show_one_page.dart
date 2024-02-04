import 'package:flutter/material.dart';
import 'package:lamna/pages/teaser/show_two_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/Indicators/indicators_sliders.dart';
import 'package:lamna/utils/widgets/button_next_page_new_vision.dart';

class ShowOnePage extends StatefulWidget {
  const ShowOnePage({super.key});

  @override
  State<ShowOnePage> createState() => _ShowOnePageState();
}

class _ShowOnePageState extends State<ShowOnePage> {
  @override
  Widget build(BuildContext context) {
    int indexPageActive = 0;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'lämna',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 40,
            color: ColorConstants.greenLightAppColor,
            fontFamily: FontConstants.principalFont,
          ),
        ),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IndicatorsSliders(indexPageActive: indexPageActive),
            Center(
              child: Image.asset('assets/pictures/World Bicycle Day_pana.png',
                  fit: BoxFit.fill),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: const TravelTitle(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: ButtonNextPageNewVison(
                  context: context,
                  page: const ShowTwoPage(),
                  title: 'Suivant',
                  color: ColorConstants.greenLightAppColor,
                  icon: Icons.east,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Title Page
class TravelTitle extends StatelessWidget {
  const TravelTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorConstants.greenDarkAppColor), //style for all textspan
          TextSpan(
            children: [
              TextSpan(
                text: "Voyagez de manière ",
                style: TextStyle(
                    fontSize: 30,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: " éco-responsable ",
                style: TextStyle(
                    color: ColorConstants.yellowPrimaryAppColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
