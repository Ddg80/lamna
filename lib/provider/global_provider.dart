import 'package:flutter/material.dart';
import 'package:lamna/models/city.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/models/mastercard.dart';
import 'package:lamna/models/travel.dart';

class GlobalProvider extends ChangeNotifier {
  int idCity = 0;
  final List<Itinerary> _itinerariesSelected = [];
  final List<Travel> _travelReserved = [];
  final List<MasterCard> _masterCard = [];
  List<City> cities = [];

  // Add Itinerary selected
  setItinerariesSelected(int index) {
    List<Itinerary> itinerary =
        itineraries.where((it) => it.id == index).toList();
    if (!_itinerariesSelected
        .map((item) => item.id)
        .contains(itinerary[0].id)) {
      _itinerariesSelected.add(itinerary[0]);
    }
    // print('itineraries:  $_itinerariesSelected');
    notifyListeners();
  }

  int getLengthItineraiesSelected() {
    return _itinerariesSelected.length;
  }

  // Add Travel Selected
  setTravelSelected(Travel travel) {
    if (_travelReserved.isEmpty) {
      _travelReserved.add(travel);
    } else {
      _travelReserved.clear();
      _travelReserved.add(travel);
    }
    // print('travel reserved:  $_travelReserved');
    notifyListeners();
  }

  bool isNotEmptyTravelSelected() {
    return _travelReserved.isNotEmpty;
  }

  int getIdTravelSelected() {
    if (_travelReserved.isNotEmpty) {
      return _travelReserved[0].id;
    }
    return 0;
  }

  String getCategoryTravelSelected() {
    if (_travelReserved.isNotEmpty) {
      return _travelReserved[0].category;
    }
    return '';
  }

  setIdCityChoose(int idChoose) {
    idCity = idChoose;
    notifyListeners();
    // print('idCity: $idCity');
  }

  getIdCity() {
    return idCity;
  }

  // Add MasterCards
  setMasterCard(MasterCard card) {
    if (_masterCard.isEmpty) {
      _masterCard.add(card);
    } else {
      _masterCard.clear();
      _masterCard.add(card);
    }
    print('masterCard save:  $_masterCard');
    notifyListeners();
  }
}
