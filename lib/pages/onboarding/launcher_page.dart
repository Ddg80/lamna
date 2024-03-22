import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lamna/pages/onboarding/on_boarding_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/images/lamna_logo.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      // 5 seconds over, navigate to Page2.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OnBoardingPage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: Center(
        child: LamnaLogo(context: context),
      ),
    );
  }
}
