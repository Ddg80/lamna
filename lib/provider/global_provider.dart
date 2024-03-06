import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lamna/models/city.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/models/mastercard.dart';
import 'package:lamna/models/reservation.dart';
import 'package:lamna/models/setting.dart';
import 'package:lamna/models/travel.dart';
import 'package:intl/date_symbol_data_local.dart';

class GlobalProvider extends ChangeNotifier {
  int idCity = 0;
  String _linkCollaboration = "";
  List<Itinerary> _itineraries = [];
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
  int _countItinerarySelected = 0;
  final Setting _logout = Setting(
    id: 6,
    pictureSVG: 'assets/icons/logout.svg',
    title: 'Logout',
    subtitle: 'A bientôt !',
  );

  final List<Setting> _settings = [
    Setting(
      id: 1,
      pictureSVG: 'assets/menu-icons/user.svg',
      title: 'Compte',
      subtitle: 'Profil, Sécurité, mentions légales',
    ),
    Setting(
      id: 2,
      pictureSVG: 'assets/icons/settings-01.svg',
      title: 'Apparence',
      subtitle: 'Theme, Couleurs, fonds',
    ),
    Setting(
      id: 3,
      pictureSVG: 'assets/icons/bell.svg',
      title: 'Notifications',
      subtitle: 'Nouveautés, Mise à jour, Suggestions',
    ),
    Setting(
      id: 4,
      pictureSVG: 'assets/icons/key.svg',
      title: 'Permissions',
      subtitle: 'Caméra, Storage, GPS',
    ),
    Setting(
      id: 5,
      pictureSVG: 'assets/icons/network-wireless.svg',
      title: 'Autre',
      subtitle: 'Language, réseaux',
    )
  ];

// TRAVEL
  getInfosSelectedForTravel() {
    if (_travelReserved.isNotEmpty && _formReservation.isNotEmpty) {
      var dataFormReservation = _formReservation.values.toList();
      int nbPassengers =
          int.parse(dataFormReservation[dataFormReservation.length - 1]);
      _total = 0.0;
      _commission = 0.0;
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

// SINGLE ITINERARY
  getSingleItinerary(int id) {
    return _itineraries.where((it) => it.id == id).toList();
  }

  setSingleItineraryLike(bool like, int id) {
    int indexItinerary = _itineraries.indexWhere((it) => it.id == id);
    if (like) {
      setItineraryDisLiked(indexItinerary);
    } else {
      setItineraryLiked(indexItinerary);
    }
  }

// ITINERARY
  getCurrentNbItineraryLiked() {
    _countItinerarySelected =
        _itineraries.where((it) => it.like == true).toList().length;
  }

  getCountItinerarySelected() {
    getCurrentNbItineraryLiked();
    return _countItinerarySelected;
  }

  setItineraryLiked(int index) {
    setHaveAItinerary(true);
    _itineraries[index].like = true;
    notifyListeners();
  }

  setItineraryDisLiked(int index) {
    _itineraries[index].like = false;
    notifyListeners();
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

  getItinerariesSelected() {
    return _itineraries.where((it) => it.like == true).toList();
  }

  getItinerariesNoSelected() {
    return _itineraries.where((it) => it.like == false).toList();
  }

  // ITINERARIES
  setItineraries(List<Itinerary> itineraries) {
    if (_itineraries.isEmpty) {
      _itineraries = itineraries;
    }
    notifyListeners();
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

  // linkCollaboration
  getLinkCollaboration() {
    return _linkCollaboration;
  }

  setLinkCollaboration(String link) {
    _linkCollaboration = link;
    notifyListeners();
  }

  // SETTINGS
  getSettings() {
    return _settings;
  }

  // LOGOUT
  getLogoutSettings() {
    return _logout;
  }

  getCurrentDate(context) {
    initializeDateFormatting('en', null);
    String locale = Localizations.localeOf(context).languageCode;
    DateTime now = DateTime.now();
    String dayOfWeek = DateFormat.EEEE(locale).format(now);
    String dayMonth = DateFormat.MMMMd(locale).format(now);
    String year = DateFormat.y(locale).format(now);

    return "$dayOfWeek $dayMonth $year";
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
