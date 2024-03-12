import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamna/pages/onboarding/show_one_page.dart';
import 'package:lamna/pages/onboarding/show_three_page.dart';
import 'package:lamna/pages/onboarding/show_two_page.dart';
import 'package:lamna/pages/onboarding/start_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';

List<dynamic> pages = [
  const StartPage(),
  const ShowOnePage(),
  const ShowTwoPage(),
  const ShowThreePage(),
];

class OnBoardingPage extends StatefulWidget {
  final initialPage = 0;
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initialPage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
      body: PageView.builder(
        itemCount: pages.length,
        controller: _pageController,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
