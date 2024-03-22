import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamna/pages/onboarding/show_one_page.dart';
import 'package:lamna/pages/onboarding/show_three_page.dart';
import 'package:lamna/pages/onboarding/show_two_page.dart';
import 'package:lamna/pages/onboarding/start_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class OnBoardingPage extends StatefulWidget {
  final List<dynamic> pages = [
    const StartPage(),
    const ShowOnePage(),
    const ShowTwoPage(),
    const ShowThreePage(),
  ];
  final initialPage = 0;
  OnBoardingPage({super.key});

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
        itemCount: widget.pages.length,
        controller: _pageController,
        itemBuilder: (context, index) {
          return widget.pages[index];
        },
      ),
    );
  }
}
