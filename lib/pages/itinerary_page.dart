import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/pages/reserved/form_transportation_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';
import 'package:lamna/utils/widgets/itinerary/title_itinerary.dart';
import 'package:lamna/utils/widgets/itinerary/text_itinerary_counter.dart';
import 'package:provider/provider.dart';

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  final CardSwiperController controller = CardSwiperController();
  int _counter = 0;
  int _maxTap = itineraries.length;
  int _idItinerary = 0;
  @override
  void initState() {
    super.initState();
  }

  _likeAction() {
    setState(() {
      if (_maxTap >= 1) {
        _counter++;
        _maxTap--;
        _idItinerary++;
      }
    });
    log(_maxTap.toString());
  }

  _nopeAction() {
    if (_maxTap >= 1) {
      _maxTap--;
      _idItinerary++;
    }
    log(_maxTap.toString());
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
          padding: EdgeInsets.only(top: 6.0),
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
            child: Text(
              'Découvre les itinéraires disponibles et met de côté ceux qui te plaisent pour plus tard.',
              style: TextStyle(fontFamily: FontConstants.regularFont),
            ),
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
                          _nopeAction();
                          controller.swipe(CardSwiperDirection.right);
                          if (_maxTap == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                    'Vous êtes arrivés au maximum de vos choix.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
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
                          _likeAction();
                          controller.swipe(CardSwiperDirection.right);
                          Provider.of<GlobalProvider>(context, listen: false)
                              .setItinerariesSelected(_idItinerary);
                          if (_maxTap == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                    'Vous êtes arrivés au maximum de vos choix.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
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
                TextItineraryCounter(counter: _counter),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        height: 50,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: ButtonLarge(
            text: "Valider mes itinéraires",
            color: ColorConstants.greenLightAppColor,
            fontsize: 18,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FormTransportationPage(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: ColorConstants.greenLightAppColor,
                  content: _counter > 0
                      ? const Text('Sauvegarde de vos itinéraires')
                      : const Text('Aucun itinéraire sauvegardé'),
                ),
              );
            },
          ),
        ),
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
