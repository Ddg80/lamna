import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  _likeAction() {
    controller.swipeRight();
  }

  _nopeAction() {
    controller.swipeLeft();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
              onSwipe: _onSwipe,
              onUndo: _onUndo,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          _likeAction();
                        },
                        child: Container(
                          height: 60,
                          width: 145,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(35),
                            gradient: LinearGradient(
                              colors: [
                                ColorConstants.redBlurSecondaryColor
                                    .withOpacity(0.05),
                                ColorConstants.redDarkAppColor.withOpacity(.5),
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/chevron-left-double.svg',
                                width: 85,
                              ),
                              Image.asset(
                                'assets/icons/unlike.png',
                                width: 58,
                                height: 58,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          _nopeAction();
                        },
                        child: Container(
                          height: 60,
                          width: 145,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(35),
                            gradient: LinearGradient(
                              colors: [
                                ColorConstants.greenDarkAppColor
                                    .withOpacity(.5),
                                ColorConstants.greenBlurSecondaryColor
                                    .withOpacity(0.05)
                              ],
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/like.png',
                                  width: 58,
                                  height: 58,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/chevron-right-double.svg',
                                  width: 85,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: Text('2 itinéraires sauvegardés'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
