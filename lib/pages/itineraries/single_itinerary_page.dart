import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/pages/itineraries/itineraries_page.dart';
import 'package:lamna/pages/map/map_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/button_next_page_new_vision.dart';
import 'package:lamna/utils/widgets/itinerary/header_itinerary_details.dart';
import 'package:lamna/utils/widgets/itinerary/label_itinerary.dart';
import 'package:provider/provider.dart';

class SingleItineraryPage extends StatefulWidget {
  final Itinerary itinerary;
  const SingleItineraryPage({super.key, required this.itinerary});

  @override
  State<SingleItineraryPage> createState() => _SingleItineraryPageState();
}

class _SingleItineraryPageState extends State<SingleItineraryPage> {
  late final provider = Provider.of<GlobalProvider>(context, listen: false);
  void _navigate() {
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => const ItinerariesPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("TODO LIKE AND DISLIKE:${widget.itinerary}");
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {
            _navigate();
          },
          child: Container(
            transform: Matrix4.translationValues(-10, 0, 0),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderItineraryDetails(widget: widget),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.only(top: 28.0, left: 14.0),
                  child:
                      widget.itinerary.titleItinerary != 'Flâneries médiévales '
                          ? Row(
                              children: [
                                Text(
                                  widget.itinerary.titleItinerary,
                                  style: TextStyle(
                                    color: ColorConstants.greenLightAppColor,
                                    fontSize: 30,
                                    fontFamily: FontConstants.regularFont,
                                    fontWeight: FontWeight.w400,
                                    height: 0.04,
                                  ),
                                ),
                                Text(
                                  widget.itinerary.subtitleItinerary,
                                  style: TextStyle(
                                    color: ColorConstants.greenLightAppColor,
                                    fontSize: 30,
                                    fontFamily: FontConstants.principalFont,
                                    fontWeight: FontWeight.w600,
                                    height: 0.04,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.itinerary.titleItinerary,
                                  style: TextStyle(
                                    color: ColorConstants.greenLightAppColor,
                                    fontSize: 30,
                                    fontFamily: FontConstants.principalFont,
                                    fontWeight: FontWeight.w600,
                                    height: 0.04,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  widget.itinerary.subtitleItinerary,
                                  style: TextStyle(
                                    color: ColorConstants.greenLightAppColor,
                                    fontSize: 30,
                                    fontFamily: FontConstants.regularFont,
                                    fontWeight: FontWeight.w400,
                                    height: 0.04,
                                  ),
                                ),
                              ],
                            )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelItinerary(
                      indicator: widget.itinerary.nbSite,
                      content: ' LIEUX',
                      icon: "assets/icons/ping.svg",
                    ),
                    LabelItinerary(
                      distance: widget.itinerary.distance,
                      content: ' KM',
                      icon: 'assets/icons/route.svg',
                    ),
                    LabelItinerary(
                      indicator: widget.itinerary.days,
                      content: ' JOURS',
                      icon: 'assets/icons/calendar.svg',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: Text(widget.itinerary.description),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 0.3,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: widget.itinerary.images
                  .map(
                    (item) => ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 18.0),
              child: Text(
                'Carte de l’itinéraire',
                style: TextStyle(
                  color: ColorConstants.greenDarkAppColor,
                  fontSize: 22,
                  fontFamily: FontConstants.principalFont,
                  fontWeight: FontWeight.w600,
                  height: 0.06,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0, left: 18.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 400,
                  child: Image.asset('assets/FakeMap.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 18.0),
              child: Text(
                'Points d\'intérêt',
                style: TextStyle(
                  color: ColorConstants.greenDarkAppColor,
                  fontSize: 22,
                  fontFamily: FontConstants.principalFont,
                  fontWeight: FontWeight.w600,
                  height: 0.06,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        height: 50,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  print(
                      "LIKE OU DISLIKE : ${widget.itinerary.like} ${widget.itinerary.id}");
                },
                child: widget.itinerary.like
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 66,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: ColorConstants.whiteAppColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset('assets/icons/like.svg')
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 66,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: ColorConstants.whiteAppColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset('assets/icons/dislike.svg')
                            ],
                          ),
                        ),
                      ),
              ),
              ButtonNextPageNewVison(
                context: context,
                page: const MapPage(),
                title: 'Lancer l\'itinéraire',
                color: ColorConstants.greenDarkAppColor,
                icon: Icons.east,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
