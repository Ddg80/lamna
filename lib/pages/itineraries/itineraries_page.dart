import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/pages/reserved/destination_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';
import 'package:lamna/utils/widgets/itineraries/title_itineraries.dart';
import 'package:provider/provider.dart';

class ItinerariesPage extends StatefulWidget {
  const ItinerariesPage({super.key});

  @override
  State<ItinerariesPage> createState() => _ItinerariesPageState();
}

class _ItinerariesPageState extends State<ItinerariesPage> {
  late final provider = Provider.of<GlobalProvider>(context, listen: true);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (provider.getHaveAItinerary())
            ? titleItineraries(context)
            : Container(),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: (provider.getHaveAItinerary()) ? 80 : 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 18.0),
              child: (provider.getHaveAItinerary())
                  ? Row(
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Itinéraires',
                                style: TextStyle(
                                  color: Color(0xFF3C674C),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0.08,
                                ),
                              ),
                              TextSpan(
                                text: ' sauvegardés',
                                style: TextStyle(
                                  color: Color(0xFF3C674C),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0.08,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SvgPicture.asset('assets/icons/heart.svg'),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Vous n’avez pas réservé',
                          style: TextStyle(
                            color: ColorConstants.greenDarkAppColor,
                            fontSize: 23,
                            fontFamily: FontConstants.regularFont,
                            fontWeight: FontWeight.w600,
                            height: 0.05,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          ' de voyage pour le moment 😔',
                          style: TextStyle(
                            color: ColorConstants.greenDarkAppColor,
                            fontSize: 23,
                            fontFamily: FontConstants.regularFont,
                            fontWeight: FontWeight.w600,
                            height: 0.05,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Avant de partir à la découverte des itinéraires ',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: FontConstants.interRegularFont,
                            fontWeight: FontWeight.w400,
                            height: 0.05,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'que l’on a préparé, tu dois déjà choisir ',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontConstants.interRegularFont,
                            fontWeight: FontWeight.w400,
                            height: 0.05,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'ta destination.',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontConstants.interRegularFont,
                            fontWeight: FontWeight.w400,
                            height: 0.05,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .6,
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
                        ),
                        Center(
                          child: Image.asset(
                            'assets/pictures/User-flow-pana.png',
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
