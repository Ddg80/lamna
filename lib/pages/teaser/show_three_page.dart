import 'package:flutter/material.dart';
import 'package:lamna/pages/auth/register_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/button_next_page_new_vision.dart';
import 'package:lamna/utils/widgets/indicators.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indicators(indexPageActive),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                )
              ],
            ),
            Center(
              child: Image.asset('assets/pictures/Retail markdown_pana.png',
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
                    page: const RegisterPage(),
                    title: 'Terminer',
                    color: ColorConstants.greenLightAppColor),
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
                text: "Et en faisant des ",
                style: TextStyle(
                    fontSize: 28,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: "économies ",
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
