import 'package:flutter/material.dart';

import 'package:lamna/models/city.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/models/mastercard.dart';
import 'package:lamna/models/reservation.dart';
import 'package:lamna/models/travel.dart';

class GlobalProvider extends ChangeNotifier {
  int idCity = 0;
  final List<Itinerary> _itinerariesSelected = [];
  final List<Travel> _travelReserved = [];
  final List<MasterCard> _masterCard = [];
  List<City> cities = [];
  Map<String, String> _formReservation = {};
  double _total = 0.0;
  double _commission = 0.0;

  getInfosSelectedForTravel() {
    if (_travelReserved.isNotEmpty && _formReservation.isNotEmpty) {
      var dataFormReservation = _formReservation.values.toList();
      int nbPassengers =
          int.parse(dataFormReservation[dataFormReservation.length - 1]);
      double pricePerPerson = _travelReserved[0].pricePerPerson;
      double total = (pricePerPerson * nbPassengers);
      int percent = _travelReserved[0].percent;
      Reservation infosReservation = Reservation(
        id: _travelReserved[0].id,
        startHour: _travelReserved[0].startHour,
        cityStart: _travelReserved[0].cityStart,
        startDate: dataFormReservation[1],
        finishHour: _travelReserved[0].finishHour,
        cityFinish: _travelReserved[0].cityFinish,
        returnDate: dataFormReservation[3],
        pricePerPerson: pricePerPerson,
        timeTravel: _travelReserved[0].timeTravel,
        percent: percent,
        category: _travelReserved[0].category,
        numberPassengers: nbPassengers,
        total: total.toPrecision(2),
        commission: ((percent / total) * 100).toPrecision(2),
      );
      _total = infosReservation.total;
      _commission = infosReservation.commission;
      notifyListeners();
    }
  }

  getTotalReservation() {
    return _total;
  }

  getCommissionReservation() {
    return _commission;
  }

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
    notifyListeners();
  }

  // Add Itinerary selected
  setReservationSelected(data) {
    if (_formReservation.isEmpty) {
      _formReservation = data;
    } else {
      _formReservation.clear();
      _formReservation = data;
    }
    notifyListeners();
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
