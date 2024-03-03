import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/pages/onboarding/show_two_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/Indicators/indicators_sliders.dart';
import 'package:lamna/utils/widgets/button_next_page_new_vision.dart';
import 'package:lamna/utils/widgets/teaser/travel_title.dart';
import 'package:provider/provider.dart';

class ShowOnePage extends StatefulWidget {
  const ShowOnePage({super.key});
  @override
  State<ShowOnePage> createState() => _ShowOnePageState();
}

class _ShowOnePageState extends State<ShowOnePage> {
  // ITINERARIES
  void loadItineraries(context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/itineraries.json");
    List mapData = jsonDecode(data);
    List<Itinerary> itineraries =
        mapData.map((itinerary) => Itinerary.fromJson(itinerary)).toList();
    late final provider = Provider.of<GlobalProvider>(context, listen: false);
    provider.setItineraries(itineraries);
  }

  @override
  Widget build(BuildContext context) {
    loadItineraries(context);
    int indexPageActive = 0;
    return Scaffold(
      extendBody: true,
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
            IndicatorsSliders(indexPageActive: indexPageActive),
            Center(
              child: Image.asset(
                'assets/pictures/World Bicycle Day_pana.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: const TravelTitle(
                text1: "Voyagez de manière ",
                text2: " éco-responsable ",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        height: 50,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.60,
          child: ButtonNextPageNewVison(
            context: context,
            page: const ShowTwoPage(),
            title: 'Suivant',
            color: ColorConstants.greenLightAppColor,
            icon: Icons.east,
          ),
        ),
      ),
    );
  }
}
