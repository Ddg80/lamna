import 'package:flutter/material.dart';
import 'package:lamna/models/city.dart';
import 'package:lamna/models/itinerary.dart';

class GlobalProvider extends ChangeNotifier {
  int idCity = 0;
  final List<Itinerary> _itinerariesSelected = [];
  List<City> cities = [];

  setItinerariesSelected(int index) {
    List<Itinerary> itinerary =
        itineraries.where((it) => it.id == index).toList();
    if (!_itinerariesSelected
        .map((item) => item.id)
        .contains(itinerary[0].id)) {
      _itinerariesSelected.add(itinerary[0]);
    }
    //TODO : SAVE IN BDD
    // print('itineraries:  $_itinerariesSelected');
    notifyListeners();
  }

  setIdCityChoose(int idChoose) {
    idCity = idChoose;
    print('idCity: $idCity');
  }

  getIdCity() {
    return idCity;
  }
}
