import 'package:flutter/material.dart';
import 'package:lamna/pages/onboarding/show_three_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/Indicators/indicators_sliders.dart';
import 'package:lamna/utils/widgets/buttons/button_next_page_new_vision.dart';

import '../../utils/widgets/teaser/travel_title.dart';

class ShowTwoPage extends StatefulWidget {
  const ShowTwoPage({super.key});

  @override
  State<ShowTwoPage> createState() => _ShowTwoPageState();
}

class _ShowTwoPageState extends State<ShowTwoPage> {
  @override
  Widget build(BuildContext context) {
    int indexPageActive = 1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 88.0),
          child: Column(
            children: [
              IndicatorsSliders(indexPageActive: indexPageActive),
              Center(
                child: Image.asset(
                  'assets/pictures/Location search_pana.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: const TravelTitle(
                    text1: "Tout en consommant ",
                    text2: " produits locaux ",
                    text3: "des"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        height: 50,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.60,
          child: ButtonNextPageNewVison(
            context: context,
            page: const ShowThreePage(),
            title: 'Suivant',
            color: ColorConstants.greenLightAppColor,
            icon: Icons.east,
          ),
        ),
      ),
    );
  }
}
