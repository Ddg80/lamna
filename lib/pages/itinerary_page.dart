import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/itinerary/title_itinerary.dart';

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  final CardSwiperController controller = CardSwiperController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: TitleItinerary(),
        ),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Text(
                'Découvre les itinéraires disponibles et met de côté ceux qui te plaisent pour plus tard.'),
          ),
          Flexible(
            child: CardSwiper(
              controller: controller,
              cardsCount: itineraries.length,
              cardBuilder: (
                context,
                index,
                percentThresholdX,
                percentThresholdY,
              ) =>
                  Container(
                alignment: Alignment.center,
                child: Image.asset(
                  itineraries[index].image,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
