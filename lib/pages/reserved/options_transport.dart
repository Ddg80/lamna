import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lamna/models/travel.dart';
import 'package:lamna/pages/reserved/payments_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';
import 'package:lamna/utils/widgets/reserved/title_options_transport.dart';
import 'package:provider/provider.dart';

class OptionsTransportPage extends StatefulWidget {
  const OptionsTransportPage({super.key});

  @override
  State<OptionsTransportPage> createState() => _OptionsTransportPageState();
}

class _OptionsTransportPageState extends State<OptionsTransportPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: const TitleOptionsTransport(),
          toolbarHeight: 80,
          bottom: TabBar(
            dividerColor: Colors.transparent,
            labelColor: ColorConstants.greenDarkAppColor,
            indicatorColor: ColorConstants.greenDarkAppColor,
            tabs: const <Widget>[
              Tab(
                child: Column(
                  children: [
                    Text('Aller'),
                    Text('21/02/2023'),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Text('Retour'),
                    Text('21/02/2023'),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        ),
        body: const TabBarView(
          children: <Widget>[
            NestedTabBar('Aller'),
            NestedTabBar('Retour'),
          ],
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          height: 50,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ButtonLarge(
              text: 'Valider mon choix',
              color: ColorConstants.greenDarkAppColor,
              keyForm: null,
              fontsize: 18.0,
              page: const PaymentsPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  Future<List<Travel>> fetchListTravelsTrain() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/trainTravels.json");
    List mapData = jsonDecode(data);
    // print(mapData);
    return mapData.map((travelTrain) => Travel.fromJson(travelTrain)).toList();
  }

  Future<List<Travel>> fetchListTravelsBus() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/busTravels.json");
    List mapData = jsonDecode(data);
    // print(mapData);
    return mapData.map((travelBus) => Travel.fromJson(travelBus)).toList();
  }

  Future<List<Travel>> fetchListTravelsCovoit() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/covoitTravels.json");
    List mapData = jsonDecode(data);
    // print(mapData);
    return mapData
        .map((travelCovoit) => Travel.fromJson(travelCovoit))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          dividerColor: ColorConstants.whiteAppColor,
          labelColor: ColorConstants.greenDarkAppColor,
          indicatorColor: ColorConstants.greenDarkAppColor,
          tabs: const <Widget>[
            Tab(text: '🚅 Train'),
            Tab(text: '🚌 Bus'),
            Tab(text: '🚗 Covoit`'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              SingleChildScrollView(
                child: FutureBuilder<List<Travel>>(
                  future: fetchListTravelsTrain(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Travel> travelList = snapshot.data!;
                      return Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: travelList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Provider.of<GlobalProvider>(context,
                                          listen: false)
                                      .setTravelSelected(travelList[index]);
                                },
                                child: Card(
                                  color: ColorConstants.whiteAppColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  elevation: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6.0,
                                        left: 6.0,
                                        right: 6.0,
                                        bottom: 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  travelList[index].startHour,
                                                  style: TextStyle(
                                                      color: ColorConstants
                                                          .greenDarkAppColor,
                                                      fontFamily: FontConstants
                                                          .regularFont,
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  travelList[index].finishHour,
                                                  style: TextStyle(
                                                      color: ColorConstants
                                                          .greenDarkAppColor,
                                                      fontFamily: FontConstants
                                                          .regularFont,
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  travelList[index].cityStart,
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .greyAppColor,
                                                    fontFamily: FontConstants
                                                        .regularFont,
                                                    fontSize: 19,
                                                  ),
                                                ),
                                                Text(
                                                  travelList[index].cityFinish,
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .greyAppColor,
                                                    fontFamily: FontConstants
                                                        .regularFont,
                                                    fontSize: 19,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "${travelList[index].pricePerPerson.toString()} €",
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .greenLightAppColor,
                                                    fontFamily: FontConstants
                                                        .semiBoldFont,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                                Text(
                                                  'par pers.',
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .blackAppColor,
                                                    fontFamily: FontConstants
                                                        .semiBoldFont,
                                                    fontSize: 13,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                              '🕒 ${travelList[index].timeTravel} ${travelList[index].percent}% de réduction chez les commerçants'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    } else {
                      return const Text('Pas de data');
                    }
                  },
                ),
              ),
              SingleChildScrollView(
                child: FutureBuilder<List<Travel>>(
                  future: fetchListTravelsBus(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Travel> travelList = snapshot.data!;
                      return Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: travelList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Provider.of<GlobalProvider>(context,
                                          listen: false)
                                      .setTravelSelected(travelList[index]);
                                },
                                child: Card(
                                  color: ColorConstants.whiteAppColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  elevation: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6.0,
                                        left: 6.0,
                                        right: 6.0,
                                        bottom: 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  travelList[index].startHour,
                                                  style: TextStyle(
                                                      color: ColorConstants
                                                          .greenDarkAppColor,
                                                      fontFamily: FontConstants
                                                          .regularFont,
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  travelList[index].finishHour,
                                                  style: TextStyle(
                                                      color: ColorConstants
                                                          .greenDarkAppColor,
                                                      fontFamily: FontConstants
                                                          .regularFont,
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  travelList[index].cityStart,
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .greyAppColor,
                                                    fontFamily: FontConstants
                                                        .regularFont,
                                                    fontSize: 19,
                                                  ),
                                                ),
                                                Text(
                                                  travelList[index].cityFinish,
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .greyAppColor,
                                                    fontFamily: FontConstants
                                                        .regularFont,
                                                    fontSize: 19,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "${travelList[index].pricePerPerson.toString()} €",
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .greenLightAppColor,
                                                    fontFamily: FontConstants
                                                        .semiBoldFont,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                                Text(
                                                  'par pers.',
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .blackAppColor,
                                                    fontFamily: FontConstants
                                                        .semiBoldFont,
                                                    fontSize: 13,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                              '🕒 ${travelList[index].timeTravel} ${travelList[index].percent}% de réduction chez les commerçants'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    } else {
                      return const Text('Pas de data');
                    }
                  },
                ),
              ),
              SingleChildScrollView(
                child: FutureBuilder<List<Travel>>(
                  future: fetchListTravelsCovoit(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Travel> travelList = snapshot.data!;
                      return Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: travelList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Provider.of<GlobalProvider>(context,
                                          listen: false)
                                      .setTravelSelected(travelList[index]);
                                },
                                child: Card(
                                  color: ColorConstants.whiteAppColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  elevation: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6.0,
                                        left: 6.0,
                                        right: 6.0,
                                        bottom: 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  travelList[index].startHour,
                                                  style: TextStyle(
                                                      color: ColorConstants
                                                          .greenDarkAppColor,
                                                      fontFamily: FontConstants
                                                          .regularFont,
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  travelList[index].finishHour,
                                                  style: TextStyle(
                                                      color: ColorConstants
                                                          .greenDarkAppColor,
                                                      fontFamily: FontConstants
                                                          .regularFont,
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  travelList[index].cityStart,
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .greyAppColor,
                                                    fontFamily: FontConstants
                                                        .regularFont,
                                                    fontSize: 19,
                                                  ),
                                                ),
                                                Text(
                                                  travelList[index].cityFinish,
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .greyAppColor,
                                                    fontFamily: FontConstants
                                                        .regularFont,
                                                    fontSize: 19,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "${travelList[index].pricePerPerson.toString()} €",
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .greenLightAppColor,
                                                    fontFamily: FontConstants
                                                        .semiBoldFont,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                                Text(
                                                  'par pers.',
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .blackAppColor,
                                                    fontFamily: FontConstants
                                                        .semiBoldFont,
                                                    fontSize: 13,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                              '🕒 ${travelList[index].timeTravel} ${travelList[index].percent}% de réduction chez les commerçants'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    } else {
                      return const Text('Pas de data');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
