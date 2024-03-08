import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indexed/indexed.dart';
import 'package:lamna/pages/home_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';
import 'package:provider/provider.dart';

class ValidateCommandPage extends StatefulWidget {
  const ValidateCommandPage({super.key});

  @override
  State<ValidateCommandPage> createState() => _ValidateCommandPageState();
}

class _ValidateCommandPageState extends State<ValidateCommandPage> {
  bool isLoading = true;

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 10.0, top: 44.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isLoading ? 'En attente ,' : 'Félicitation, ',
                      style: TextStyle(
                        color: ColorConstants.greenDarkAppColor,
                        fontSize: 24,
                        fontFamily: FontConstants.principalFont,
                      ),
                    ),
                    Text(
                      isLoading
                          ? 'Transaction en cours... ,'
                          : 'Voyage à Rennes confirmé !',
                      style: TextStyle(
                        color: ColorConstants.greenDarkAppColor,
                        fontSize: 24,
                        fontFamily: FontConstants.regularFont,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: isLoading
                          ? Center(
                              child: SizedBox(
                                height: 45,
                                width: 45,
                                child: SpinKitThreeBounce(
                                  color: ColorConstants.greenLightAppColor,
                                  size: 25.0,
                                ),
                              ),
                            )
                          : ButtonLarge(
                              text: 'Accéder à la carte',
                              color: ColorConstants.greenLightAppColor,
                              fontsize: 18,
                              onPressed: () {
                                if (!isLoading) {
                                  Provider.of<GlobalProvider>(context,
                                          listen: false)
                                      .setItineraryStarted(false);
                                  Provider.of<GlobalProvider>(context,
                                          listen: false)
                                      .setSelectedItineraryId(null);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HomePage(currentIndex: 1),
                                    ),
                                  );
                                }
                              },
                            ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(-28, 0, 0),
              child: Indexer(children: [
                Indexed(
                  index: 1,
                  child: Positioned(
                    top: 14,
                    left: 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 74,
                      decoration: ShapeDecoration(
                        color: ColorConstants.whiteAppColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: ColorConstants.whiteAppColor,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFD4FAE4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: Stack(children: [
                                      SvgPicture.asset(
                                        'assets/icons/trendDown.svg',
                                        width: 85,
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '72% de CO2 en moins\n',
                                style: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 14,
                                  fontFamily: FontConstants.interRegularFont,
                                  fontWeight: FontWeight.w700,
                                  height: 0.07,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'par rapport à un trajet en voiture',
                                style: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 14,
                                  fontFamily: FontConstants.interRegularFont,
                                  fontWeight: FontWeight.w400,
                                  height: 0.07,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Indexed(
                  index: 0,
                  child: Image.asset(
                    'assets/pictures/directionsPana.png',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width * 0.85,
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
