import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/pages/onboarding/show_one_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_next_page_new_vision.dart';
import 'package:lamna/utils/widgets/new_vision_title.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: SvgPicture.asset(
            'assets/logos/logoLamnaApp.svg',
            width: 150,
          ),
        ),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.3,
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  const NewVisonTitle(),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: ButtonNextPageNewVison(
                      context: context,
                      page: const ShowOnePage(),
                      title: 'Commencer',
                      color: ColorConstants.greenLightAppColor,
                      icon: Icons.east,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/pictures/Madrid_pana.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.85,
            ),
          ],
        ),
      ),
    );
  }
}
