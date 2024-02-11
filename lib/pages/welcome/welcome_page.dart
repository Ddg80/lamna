import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/pages/city_details_page.dart';
import 'package:lamna/pages/destination_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Vous n’avez aucun voyage de ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF5A5A5A),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          ' prévu pour le moment.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF5A5A5A),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: ButtonLarge(
                            text: 'Réserver un voyage',
                            color: ColorConstants.greenUltraDarkColor,
                            fontsize: 13,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const DestinationPage(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
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
                            text: 'Notre destination ',
                            style: TextStyle(
                              color: ColorConstants.greenUltraDarkColor,
                              fontSize: 20,
                              fontFamily: FontConstants.regularFont,
                              fontWeight: FontWeight.w400,
                              height: 0.06,
                            ),
                          ),
                          const TextSpan(
                            text: 'principale',
                            style: TextStyle(
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
                      height: 20,
                    ),
                    Text(
                      'Pour son lancement, LÄMNA se positionne ',
                      style: TextStyle(
                        color: ColorConstants.blackAppColor.withOpacity(.5),
                        fontSize: 14,
                        fontFamily: FontConstants.interRegularFont,
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'sur la ville de Rennes, chef-lieu de la Bretagne.',
                      style: TextStyle(
                        color: ColorConstants.blackAppColor.withOpacity(.5),
                        fontSize: 14,
                        fontFamily: FontConstants.interRegularFont,
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/pictures/Rennes/rennes_details_page.png',
                                ),
                              ),
                            ),
                            height: 200.0,
                          ),
                          Container(
                            height: 200.0,
                            decoration: BoxDecoration(
                              color: ColorConstants.whiteAppColor,
                              gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  ColorConstants.greyAppColor.withOpacity(0.0),
                                  ColorConstants.blackAppColor,
                                ],
                                stops: const [0.0, 1.0],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Rennes',
                                    style: TextStyle(
                                      color: ColorConstants.whiteAppColor,
                                      fontSize: 24,
                                      fontFamily: FontConstants.principalFont,
                                      fontWeight: FontWeight.w600,
                                      height: 0.05,
                                    ),
                                  ),
                                  Container(
                                    width: 137,
                                    height: 22,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CityDetailsPage(id: 1),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'En savoir plus',
                                            style: TextStyle(
                                              color:
                                                  ColorConstants.whiteAppColor,
                                              fontSize: 16,
                                              fontFamily: FontConstants
                                                  .interRegularFont,
                                              fontWeight: FontWeight.w600,
                                              decoration:
                                                  TextDecoration.underline,
                                              height: 0,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.chevron_right_outlined,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
