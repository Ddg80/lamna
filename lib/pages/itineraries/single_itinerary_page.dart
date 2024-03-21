import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/pages/home_page.dart';
import 'package:lamna/pages/itineraries/itineraries_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_next_page.dart';
import 'package:lamna/utils/widgets/itinerary/header_itinerary_details.dart';
import 'package:lamna/utils/widgets/itinerary/label_itinerary.dart';
import 'package:provider/provider.dart';
import 'package:widget_zoom/widget_zoom.dart';

class SingleItineraryPage extends StatefulWidget {
  final int id;
  const SingleItineraryPage({super.key, required this.id});

  @override
  State<SingleItineraryPage> createState() => _SingleItineraryPageState();
}

class _SingleItineraryPageState extends State<SingleItineraryPage> {
  late final provider = Provider.of<GlobalProvider>(context, listen: true);

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
    List<Itinerary> itinerary = provider.getSingleItinerary(widget.id);

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorConstants.whiteAppColor,
              ),
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
            HeaderItineraryDetails(itinerary: itinerary[0]),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.only(top: 28.0, left: 14.0),
                  child: itinerary[0].titleItinerary != 'Flâneries médiévales '
                      ? Row(
                          children: [
                            Text(
                              itinerary[0].titleItinerary,
                              style: TextStyle(
                                color: ColorConstants.greenLightAppColor,
                                fontSize: 23,
                                fontFamily: FontConstants.regularFont,
                                fontWeight: FontWeight.w400,
                                height: 0.04,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              itinerary[0].subtitleItinerary,
                              style: TextStyle(
                                color: ColorConstants.greenLightAppColor,
                                fontSize: 23,
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
                              itinerary[0].titleItinerary,
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
                              itinerary[0].subtitleItinerary,
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
                      indicator: itinerary[0].nbSite,
                      content: ' LIEUX',
                      icon: "assets/icons/ping.svg",
                    ),
                    LabelItinerary(
                      distance: itinerary[0].distance,
                      content: ' KM',
                      icon: 'assets/icons/route.svg',
                    ),
                    LabelItinerary(
                      indicator: itinerary[0].days,
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
                child: Text(itinerary[0].description),
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
              items: itinerary[0]
                  .images
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
                child: Center(
                  child: WidgetZoom(
                    heroAnimationTag: 'tag',
                    zoomWidget: Image.asset(
                      'assets/FakeMap.png',
                      width: MediaQuery.of(context).size.width * .8,
                    ),
                  ),
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
            ),
            Column(
              children: <Widget>[
                for (int i = 0; i < itinerary[0].images.length; i++)
                  Column(
                    children: [
                      Card(
                        color: ColorConstants.whiteAppColor,
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0),
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(itinerary[0].images[i]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
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
                  provider.setSingleItineraryLike(
                      itinerary[0].like, itinerary[0].id);
                },
                child: itinerary[0].like
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
              ButtonNextPage(
                onPressed: () {
                  Provider.of<GlobalProvider>(context, listen: false)
                      .setItineraryStarted(false);
                  Provider.of<GlobalProvider>(context, listen: false)
                      .setSelectedItineraryId(widget.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(currentIndex: 1),
                    ),
                  );
                },
                color: ColorConstants.greenDarkAppColor,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Lancer l\'itinéraire',
                            style: TextStyle(
                              color: ColorConstants.whiteAppColor,
                              fontSize: 20,
                              fontFamily: FontConstants.regularFont,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(
                            Icons.east,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
