import 'package:flutter/material.dart';
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
        toolbarHeight: 0,
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: const NewVisonTitle(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ButtonNextPageNewVison(
                      context: context,
                      page: const ShowOnePage(),
                      title: 'Commencer',
                      color: ColorConstants.greenLightAppColor,
                      icon: Icons.east,
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
          ],
        ),
      ),
    );
  }
}
