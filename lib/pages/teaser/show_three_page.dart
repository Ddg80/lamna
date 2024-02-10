import 'package:flutter/material.dart';
import 'package:lamna/pages/auth/register_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/Indicators/indicators_sliders.dart';
import 'package:lamna/utils/widgets/button_next_page_new_vision.dart';
import 'package:lamna/utils/widgets/teaser/travel_title.dart';

class ShowThreePage extends StatefulWidget {
  const ShowThreePage({super.key});

  @override
  State<ShowThreePage> createState() => _ShowThreePageState();
}

class _ShowThreePageState extends State<ShowThreePage> {
  @override
  Widget build(BuildContext context) {
    int indexPageActive = 2;
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
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Image.asset(
                  'assets/pictures/Retail markdown_pana.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: const TravelTitle(
                text1: "Et en faisant des ",
                text2: "économies ",
              ),
            ),
          ],
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
            page: const RegisterPage(),
            title: 'Terminer',
            color: ColorConstants.greenLightAppColor,
            icon: Icons.check_circle_outline,
          ),
        ),
      ),
    );
  }
}
