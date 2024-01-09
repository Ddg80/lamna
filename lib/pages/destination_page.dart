import 'package:flutter/material.dart';
import 'package:lamna/models/city.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/destination/card_destination.dart';
import 'dart:convert';
import 'dart:async' show Future;

import 'package:lamna/utils/widgets/destination/title_destination.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  Future<List<City>> getCities() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/cities.json");
    List mapData = jsonDecode(data);
    // print(mapData);
    return mapData.map((city) => City.fromJson(city)).toList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleDestination(context),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 80,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: FutureBuilder<List<City>>(
                      future: getCities(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<City> cityList = snapshot.data!;
                          return Column(
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cityList.length,
                                itemBuilder: (context, index) {
                                  return (cityList[index].enable)
                                      ? CardDestination(
                                          id: cityList[index].id,
                                          picture: cityList[index].picture,
                                          enable: cityList[index].enable,
                                          name: cityList[index].name,
                                          label: cityList[index].label,
                                          subtitle: cityList[index].subtitle,
                                        )
                                      : Column(
                                          children: [
                                            (cityList[index].id == 2)
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12.0,
                                                            bottom: 12.0),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Row(
                                                        children: [
                                                          const Text(
                                                            'Destinations à venir',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF3B6B4E),
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              height: 0.08,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_downward_sharp,
                                                            color: ColorConstants
                                                                .greenDarkAppColor,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            CardDestination(
                                              id: cityList[index].id,
                                              picture: cityList[index].picture,
                                              enable: cityList[index].enable,
                                              name: cityList[index].name,
                                              label: cityList[index].label,
                                              subtitle:
                                                  cityList[index].subtitle,
                                            )
                                          ],
                                        );
                                },
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
