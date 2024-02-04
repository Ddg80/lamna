import 'package:flutter/material.dart';
import 'package:lamna/models/itinerary.dart';

class GlobalProvider extends ChangeNotifier {
  final int idCity = 0;
  final List<Itinerary> _itinerariesSelected = [];

  setItinerariesSelected(int index) {
    List<Itinerary> itinerary =
        itineraries.where((it) => it.id == index).toList();
    if (!_itinerariesSelected
        .map((item) => item.id)
        .contains(itinerary[0].id)) {
      _itinerariesSelected.add(itinerary[0]);
    }
    //TODO : SAVE IN BDD
    // print(_itinerariesSelected);
    notifyListeners();
  }
}
