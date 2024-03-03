import 'package:flutter/material.dart';
import 'package:lamna/models/city.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/models/mastercard.dart';
import 'package:lamna/models/reservation.dart';
import 'package:lamna/models/travel.dart';

class GlobalProvider extends ChangeNotifier {
  int idCity = 0;
  int _counterItinerary = 0;
  final List<Itinerary> _itineraries = [];
  final List<Itinerary> _itinerariesSelected = [];
  final List<Itinerary> _itinerariesNoSelected = [];
  final List<Travel> _travelReserved = [];
  final List<MasterCard> _masterCard = [];
  List<City> cities = [];
  Map<String, String> _formReservation = {};
  List<Reservation> listReservations = [];
  double _total = 0.0;
  double _commission = 0.0;
  String _startDate = '';
  String _returnDate = '';
  bool _haveATravel = false;
  bool _haveAItinerary = false;
  int _days = 0;

// TRAVEL
  getInfosSelectedForTravel() {
    if (_travelReserved.isNotEmpty && _formReservation.isNotEmpty) {
      var dataFormReservation = _formReservation.values.toList();
      int nbPassengers =
          int.parse(dataFormReservation[dataFormReservation.length - 1]);
      _total = 0.0;
      _commission = 0.0;

      print("TRAVEL RESERVED $_travelReserved");

      for (int i = 0; i < _travelReserved.length; i++) {
        double pricePerPerson = _travelReserved[i].pricePerPerson;
        double totaltmp = (pricePerPerson * nbPassengers);
        int percent = _travelReserved[i].percent;
        _total += totaltmp;

        Reservation infosReservation = Reservation(
          id: _travelReserved[i].id,
          startHour: _travelReserved[i].startHour,
          cityStart: _travelReserved[i].cityStart,
          startDate: dataFormReservation[1],
          finishHour: _travelReserved[i].finishHour,
          cityFinish: _travelReserved[i].cityFinish,
          returnDate: dataFormReservation[3],
          pricePerPerson: pricePerPerson,
          timeTravel: _travelReserved[i].timeTravel,
          percent: percent,
          category: _travelReserved[i].category,
          numberPassengers: nbPassengers,
          total: _total.toPrecision(2),
          commission: _total * (percent / 100),
        );
        _total = infosReservation.total;
        _commission = infosReservation.commission;
      }

      notifyListeners();
    }
    setHaveATravel(false);
  }

  getHaveAtravel() {
    return _haveATravel;
  }

  setHaveATravel(bool newValue) {
    _haveATravel = newValue;
  }

// Add Travel Selected
  setTravelSelected(Travel travel) {
    var travelExisting = _travelReserved
        .where((element) => element.travelType == travel.travelType);
    if (travelExisting.isEmpty) {
      _travelReserved.add(travel);
    } else {
      int indexItem = _travelReserved
          .indexWhere((item) => item.travelType == travel.travelType);
      _travelReserved.removeAt(indexItem);
      _travelReserved.add(travel);
    }
    notifyListeners();
  }

  bool isSelectedTravel(travel) {
    int indexItem = _travelReserved.indexWhere(
      (item) =>
          item.travelType == travel.travelType &&
          item.category == travel.category &&
          item.id == travel.id,
    );
    if (indexItem >= 0) {
      return true;
    }
    return false;
  }

  bool isNotEmptyTravelSelected() {
    return _travelReserved.isNotEmpty;
  }

// ITINERARY
  getCounterItinerary() {
    return _counterItinerary;
  }

  setCounterItinerary(int counter) {
    _counterItinerary = counter;
  }

  getHaveAItinerary() {
    return _haveAItinerary;
  }

  setHaveAItinerary(bool newValue) {
    _haveAItinerary = newValue;
  }

// Add Itinerary selected
  setReservationSelected(data) {
    if (_formReservation.isEmpty) {
      _formReservation = data;
    } else {
      _formReservation.clear();
      _formReservation = data;
    }
    setStartDate(_formReservation['startDate']);
    setReturnDate(_formReservation['returnDate']);
    notifyListeners();
  }

  // setLikeItinerary(int index, bool like) {
  //   if (like) {
  //     List<Itinerary> itinerary =
  //         _itinerariesSelected.where((it) => it.id == index).toList();
  //     final indexItinerary = _itinerariesSelected.indexOf(itinerary[0]);
  //     itinerary[0].like = false;
  //     print('$index, $like');
  //     print('$itinerary');
  //     print('$indexItinerary');
  //     print('$_itinerariesSelected');
  //   } else {
  //     List<Itinerary> itinerary =
  //         _itinerariesNoSelected.where((it) => it.id == index).toList();
  //     final indexItinerary = _itinerariesNoSelected.indexOf(itinerary[0]);
  //     itinerary[0].like = true;
  //     print('$index, $like');
  //     print('$itinerary');
  //     print('$indexItinerary');
  //     print('$_itinerariesNoSelected');

  //     // // Retrouver dans les itinéraires dislike
  //     // List<Itinerary> itinerary =
  //     //     _itinerariesSelected.where((it) => it.id == index).toList();
  //     // print('ITINERARY OLD : ${itinerary}');
  //     // // Mettre la valeur like = true
  //     // itinerary[0].like = true;
  //     // print('New LIKE  : ${itinerary[0].like}');
  //     // // Mettre dans les itinéraires like
  //     // _itinerariesNoSelected.add(itinerary[0]);
  //     // print(' _itinerariesNoSelected : ${_itinerariesNoSelected}');
  //     // // Supprimer des itinéraires dislike
  //     // final indexItinerary = _itinerariesSelected.indexOf(itinerary[0]);
  //     // _itinerariesSelected.removeAt(indexItinerary);
  //     // print(' _itinerariesSelected : ${_itinerariesSelected}');
  //   }
  //   notifyListeners();
  // }

  // Add Itinerary selected
  setItinerariesSelected(int index) {
    List<Itinerary> itinerary =
        _itineraries.where((it) => it.id == index).toList();
    if (!_itinerariesSelected
            .map((item) => item.id)
            .contains(itinerary[0].id) &&
        !_itinerariesNoSelected
            .map((item) => item.id)
            .contains(itinerary[0].id)) {
      itinerary[0].like = true;
      _itinerariesSelected.add(itinerary[0]);
    }
    setHaveAItinerary(true);
    // print('itineraries SELECTED:  $_itinerariesSelected');
    // print('Have a Itinerary: $_haveAItinerary');
    notifyListeners();
  }

  setItinerariesNoSelected(int index) {
    List<Itinerary> itinerary =
        _itineraries.where((it) => it.id == index).toList();
    if (!_itinerariesNoSelected
            .map((item) => item.id)
            .contains(itinerary[0].id) &&
        !_itinerariesSelected
            .map((item) => item.id)
            .contains(itinerary[0].id)) {
      itinerary[0].like = false;
      _itinerariesNoSelected.add(itinerary[0]);
    }
    // print('itineraries NO SELECTED:  $_itinerariesNoSelected');
    notifyListeners();
  }

  getItinerariesSelected() {
    return _itinerariesSelected;
  }

  getItinerariesNoSelected() {
    return _itinerariesNoSelected;
  }

  int getLengthItineraiesSelected() {
    return _itinerariesSelected.length;
  }

  // ITINERARIES
  void setItineraries(List<Itinerary> itineraries) {
    _itineraries.addAll(itineraries);
  }

  getItineraries() {
    return _itineraries;
  }

  // RESERVATION

  getTotalReservation() {
    return _total;
  }

  // DATE

  getStartDate() {
    return _startDate.toString();
  }

  getReturnDate() {
    return _returnDate.toString();
  }

  setStartDate(newDate) {
    _startDate = newDate;
  }

  setReturnDate(newDate) {
    _returnDate = newDate;
  }

  getCommissionReservation() {
    return _commission;
  }

  setDays() {
    var arrayStartDate = getStartDate().split('/');
    DateTime dateNow = DateTime.now();
    DateTime dateStart = DateTime(
      int.parse(arrayStartDate[2]),
      int.parse(arrayStartDate[1]),
      int.parse(arrayStartDate[0]),
      dateNow.hour,
      dateNow.minute,
    );

    Duration difference = dateStart.difference(dateNow);

    _days = difference.inDays;
    int hours = difference.inHours % 24;
    // int minutes = difference.inMinutes % 60;
    // int seconds = difference.inSeconds % 60;
    if (hours > 1) {
      _days++;
    }
    // print(
    //     "$_days day(s) $hours hour(s) $minutes minute(s) $seconds second(s).");
    return _days;
  }

  getDays() {
    return _days;
  }

// CITY
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
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
