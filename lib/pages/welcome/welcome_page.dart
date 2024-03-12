import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/pages/profile/collaboration_page.dart';
import 'package:lamna/pages/qr_code_page.dart';
import 'package:lamna/pages/reserved/form_transportation_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/welcome/block_have_trip_widget.dart';
import 'package:lamna/utils/widgets/welcome/block_not_travel_widget.dart';
import 'package:lamna/utils/widgets/welcome/have_itinerary.dart';
import 'package:lamna/utils/widgets/welcome/have_not_travel.dart';
import 'package:lamna/utils/widgets/welcome/options_card.dart';
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
                              TextSpan(
                                text: Provider.of<GlobalProvider>(context,
                                            listen: true)
                                        .account
                                        ?.firstName ??
                                    "Lucas ",
                                style: const TextStyle(
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
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CardOptions(
                                        textPart1: 'Mon ',
                                        textPart2: 'QR code',
                                        image:
                                            'assets/pictures/QRCode-pana.svg',
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
                                      CardOptions(
                                        textPart1: 'Reservez ',
                                        textPart2: 'encore',
                                        image: 'assets/pictures/booking.svg',
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const FormTransportationPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      top: 10.0,
                                    ),
                                    child: CardOptions(
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
                                  ),
                                ],
                              ),
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
