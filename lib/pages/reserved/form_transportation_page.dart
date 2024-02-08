import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lamna/models/city.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';
import 'package:lamna/utils/widgets/reserved/title_reserved.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FormTransportationPage extends StatefulWidget {
  const FormTransportationPage({super.key});

  @override
  State<FormTransportationPage> createState() => _FormTransportationPageState();
}

class _FormTransportationPageState extends State<FormTransportationPage> {
  final _formkey = GlobalKey<FormState>();
  late List<City> city;
  TextEditingController startCityController = TextEditingController();
  TextEditingController finishCityController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();
  TextEditingController numbersTravelController = TextEditingController();
  bool enable = false;
  DateTime currentDate = DateTime.now();
  int _currentHorizontalIntValue = 1;

  Future<List<City>> fetchCityById(int id) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/cities.json");
    List mapData = jsonDecode(data);
    List<City> cities = mapData.map((city) => City.fromJson(city)).toList();
    return cities.where((city) => city.id == id).toList();
  }

  Future<void> _selectDateStart(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: ColorConstants.lightScaffoldBackgroundColor,
                onPrimary: ColorConstants.greenDarkAppColor,
                onSurface: ColorConstants.blackAppColor,
              ),
            ),
            child: child!,
          );
        });
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        startDateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  Future<void> _selectDateReturn(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: ColorConstants.lightScaffoldBackgroundColor,
                onPrimary: ColorConstants.greenDarkAppColor,
                onSurface: ColorConstants.blackAppColor,
              ),
            ),
            child: child!,
          );
        });
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        returnDateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  void getCity(int id) async {
    var result = await fetchCityById(id);
    city = result;
    // print(city[0]);
    finishCityController.text = city[0].name;
  }

  @override
  void initState() {
    var date = DateTime.now();
    startDateController.text = DateFormat('dd/MM/yyyy').format(date);
    super.initState();
  }

  @override
  void dispose() {
    startCityController.dispose();
    finishCityController.dispose();
    startDateController.dispose();
    returnDateController.dispose();
    numbersTravelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var idCity =
        Provider.of<GlobalProvider>(context, listen: false).getIdCity();
    fetchCityById(idCity);
    getCity(idCity);
    return Scaffold(
      appBar: AppBar(
        title: Container(
            transform: Matrix4.translationValues(-38, 0, 0),
            child: const TitleReserved()),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'Confirme les informations qui concerne les modalités du moyen de transport.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: FontConstants.regularFont,
                  ),
                ),
              ),
            ),
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          'Trajet',
                          style: TextStyle(
                            fontFamily: FontConstants.principalFont,
                            color: ColorConstants.greenDarkAppColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: startCityController,
                        decoration: InputDecoration(
                          hintText: 'Ville de départ...',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: FontConstants.regularFont),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (data) {
                          if (startCityController.text.isEmpty) {
                            enable = false;
                          } else {
                            enable = true;
                          }
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Merci de renseigner une ville de départ email valide.';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: finishCityController,
                        decoration: InputDecoration(
                          hintText: finishCityController.text,
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: FontConstants.regularFont),
                          filled: true,
                          enabled: false,
                          fillColor:
                              ColorConstants.greyAppColor.withOpacity(.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          'Date de départ',
                          style: TextStyle(
                            fontFamily: FontConstants.principalFont,
                            color: ColorConstants.greenDarkAppColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: startDateController,
                        decoration: InputDecoration(
                          hintText: startDateController.text,
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: FontConstants.regularFont),
                          filled: true,
                          suffixIcon: const Icon(Icons.calendar_today),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onTap: () {
                          _selectDateStart(context);
                        },
                        onChanged: (data) {
                          if (startDateController.text.isEmpty) {
                            enable = false;
                          } else {
                            enable = true;
                          }
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Merci de renseigner une date de départ.';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          'Date d\'arrivée',
                          style: TextStyle(
                            fontFamily: FontConstants.principalFont,
                            color: ColorConstants.greenDarkAppColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: returnDateController,
                        decoration: InputDecoration(
                          hintText: 'jj/mm/aaaa',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: FontConstants.regularFont,
                          ),
                          filled: true,
                          suffixIcon: const Icon(Icons.calendar_today),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onTap: () {
                          _selectDateReturn(context);
                        },
                        onChanged: (data) {
                          if (returnDateController.text.isEmpty) {
                            enable = false;
                          } else {
                            enable = true;
                          }
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Merci de renseigner une date d\'arrivée valide.';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          'Nombre de voyageurs',
                          style: TextStyle(
                            fontFamily: FontConstants.principalFont,
                            color: ColorConstants.greenDarkAppColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      NumberPicker(
                        value: _currentHorizontalIntValue,
                        minValue: 0,
                        maxValue: 100,
                        step: 1,
                        itemHeight: 30,
                        axis: Axis.horizontal,
                        onChanged: (value) => setState(
                          () => _currentHorizontalIntValue = value,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorConstants.greenDarkAppColor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => setState(() {
                              final newValue = _currentHorizontalIntValue - 1;
                              _currentHorizontalIntValue =
                                  newValue.clamp(0, 100);
                            }),
                          ),
                          Text(
                            'Selection actuelle: $_currentHorizontalIntValue',
                            style: TextStyle(
                              fontFamily: FontConstants.regularFont,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => setState(() {
                              final newValue = _currentHorizontalIntValue + 1;
                              _currentHorizontalIntValue =
                                  newValue.clamp(0, 100);
                            }),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: ButtonLarge(
                          text: "Voir les options de transports",
                          color: enable
                              ? ColorConstants.greenLightAppColor
                              : Colors.grey,
                          keyForm: _formkey,
                          fontsize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
