import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/welcome/block_have_trip_widget.dart';
import 'package:lamna/utils/widgets/welcome/block_not_travel_widget.dart';
import 'package:lamna/utils/widgets/welcome/have_itinerary.dart';
import 'package:lamna/utils/widgets/welcome/have_not_travel.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final provider = Provider.of<GlobalProvider>(context, listen: true);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // provider.setHaveATravel(true);
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 275,
                  decoration: ShapeDecoration(
                    color: ColorConstants.greenUltraDarkColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        color: ColorConstants.greenDarkAppColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Bienvenue ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: FontConstants.principalFont,
                                  fontWeight: FontWeight.w400,
                                  height: 0.05,
                                ),
                              ),
                              const TextSpan(
                                text: 'Lucas !',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Clash Display Variable',
                                  fontWeight: FontWeight.w600,
                                  height: 0.05,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: SvgPicture.asset(
                          'assets/pictures/landingPagePana.svg',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 255,
              height: 136,
              transform: Matrix4.translationValues(0, -72, 0),
              decoration: ShapeDecoration(
                color: ColorConstants.whiteAppColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: ColorConstants.greenDarkAppColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  !provider.getHaveAtravel()
                      ? const HaveNotTravel()
                      : const HaveItinerary()
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -52, 0),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: !provider.getHaveAtravel()
                                ? 'Notre destination '
                                : 'Notre itinéraire ',
                            style: TextStyle(
                              color: ColorConstants.greenUltraDarkColor,
                              fontSize: 20,
                              fontFamily: FontConstants.regularFont,
                              fontWeight: FontWeight.w400,
                              height: 0.06,
                            ),
                          ),
                          TextSpan(
                            text: !provider.getHaveAtravel()
                                ? 'principale'
                                : ' à la une',
                            style: const TextStyle(
                              color: Color(0xFF3C674C),
                              fontSize: 20,
                              fontFamily: 'Clash Display Variable',
                              fontWeight: FontWeight.w600,
                              height: 0.06,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    !provider.getHaveAtravel()
                        ? const BlockNoTravelWidget()
                        : const BlockHavetrip(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
