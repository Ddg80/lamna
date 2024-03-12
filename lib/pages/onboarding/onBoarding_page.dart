import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamna/pages/onboarding/show_one_page.dart';
import 'package:lamna/pages/onboarding/show_three_page.dart';
import 'package:lamna/pages/onboarding/show_two_page.dart';
import 'package:lamna/pages/onboarding/start_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SvgPicture.asset(
          'assets/logos/logoLamnaApp.svg',
          width: 150,
        ),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      extendBodyBehindAppBar: true,
      body: PageView(
        children: const [
          StartPage(),
          ShowOnePage(),
          ShowTwoPage(),
          ShowThreePage(),
        ],
      ),
    );
  }
}
