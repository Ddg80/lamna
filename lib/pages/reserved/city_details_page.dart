import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lamna/models/city.dart';
import 'package:lamna/pages/reserved/destination_page.dart';
import 'package:lamna/pages/itineraries/itinerary_swipe_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_next_page_new_vision.dart';
import 'package:lamna/utils/widgets/detailsDestination/header_details_destination.dart';

class CityDetailsPage extends StatefulWidget {
  final int id;
  const CityDetailsPage({super.key, required this.id});

  @override
  State<CityDetailsPage> createState() => _CityDetailsPageState();
}

class _CityDetailsPageState extends State<CityDetailsPage> {
  Future<List<City>> getCityById() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/cities.json");
    List mapData = jsonDecode(data);
    List<City> cities = mapData.map((city) => City.fromJson(city)).toList();
    return cities.where((city) => city.id == widget.id).toList();
  }

  void _navigate() {
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => const DestinationPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<List<City>>(
        future: getCityById(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<City> city = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  HeaderDetailsDestination(
                      detailPicture: city[0].detailPicture,
                      label: city[0].label),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18.0, left: 14.0),
                          child: Text(
                            city[0].name,
                            style: TextStyle(
                              color: ColorConstants.greenDarkAppColor,
                              fontSize: 30,
                              fontFamily: FontConstants.regularFont,
                              fontWeight: FontWeight.w600,
                              height: 0.04,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18.0, left: 14.0),
                          child: Text(city[0].text),
                        ),
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
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: city[0]
                            .decoverySite
                            .map(
                              (item) => Image.asset(
                                item,
                                fit: BoxFit.cover,
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3.0, left: 14.0),
                          child: Text(
                            city[0].titleEmblematicPlaces,
                            style: TextStyle(
                              color: ColorConstants.greenDarkAppColor,
                              fontSize: 22,
                              fontFamily: FontConstants.regularFont,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: GridView.count(
                          padding: const EdgeInsets.only(left: 15.0),
                          childAspectRatio: 16 / 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          children: List.generate(
                              city[0].emblematicPlaces.length, (index) {
                            return Text(
                              '\u2022 ${city[0].emblematicPlaces[index]}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        height: 50,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: ButtonNextPageNewVison(
              context: context,
              page: const ItineraryPage(),
              title: 'Je choisis cette destination',
              color: ColorConstants.greenDarkAppColor,
              icon: Icons.east),
        ),
      ),
    );
  }
}
