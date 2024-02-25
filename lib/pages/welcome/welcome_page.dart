import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/pages/collaboration_page.dart';
import 'package:lamna/pages/qr_code_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/button_next_page_new_vision.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';
import 'package:lamna/utils/widgets/buttons/button_next_page.dart';
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
                        child: !provider.getHaveAtravel()
                            ? SvgPicture.asset(
                                'assets/pictures/landingPagePana.svg',
                                height: 200,
                              )
                            : provider.getDays() > 0
                                ? SvgPicture.asset(
                                    'assets/pictures/TravelersPana.svg',
                                    height: 200,
                                  )
                                : SvgPicture.asset(
                                    'assets/pictures/Trip-pana.svg',
                                    height: 200,
                                  ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 255,
              height: 146,
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
                    provider.getDays() > 0
                        ? Text.rich(
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
                          )
                        : Container(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    !provider.getHaveAtravel()
                        ? const BlockNoTravelWidget()
                        : provider.getDays() > 0
                            ? const BlockHavetrip()
                            : Row(children: [
                                CardOptionsQRCode(
                                  textPart1: 'Mon ',
                                  textPart2: 'QR code',
                                  image: 'assets/pictures/QRCode-pana.svg',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const QrCodePage(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CardOptionsQRCode(
                                  textPart1: 'Parrainer ',
                                  textPart2: 'un ami',
                                  image:
                                      'assets/pictures/Collaboration-pana.svg',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CollaborationPage(),
                                      ),
                                    );
                                  },
                                ),
                              ]),
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

class CardOptionsQRCode extends StatelessWidget {
  const CardOptionsQRCode({
    super.key,
    required this.textPart1,
    required this.textPart2,
    required this.image,
    required this.onTap,
  });

  final String textPart1;
  final String textPart2;
  final String image;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 195,
      decoration: ShapeDecoration(
        color: ColorConstants.whiteAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: 145,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: textPart1,
                      style: TextStyle(
                        color: ColorConstants.greenDarkAppColor,
                        fontSize: 18,
                        fontFamily: 'Clash Display Variable',
                        fontWeight: FontWeight.w400,
                        height: 0.07,
                      ),
                    ),
                    TextSpan(
                      text: textPart2,
                      style: TextStyle(
                        color: ColorConstants.greenDarkAppColor,
                        fontSize: 18,
                        fontFamily: 'Clash Display Variable',
                        fontWeight: FontWeight.w600,
                        height: 0.07,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            image,
            width: 150,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                onTap();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorConstants.greenDarkAppColor,
                  ),
                  child: const Icon(
                    Icons.east,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
