class Itinerary {
  late int id;
  late String nameCity;
  late String image;
  late String smallImage;
  late String titleItinerary;
  late int nbSite;
  late double distance;
  late int days;

  Itinerary({
    required this.id,
    required this.nameCity,
    required this.image,
    required this.smallImage,
    required this.titleItinerary,
    required this.nbSite,
    required this.distance,
    required this.days,
  });

  @override
  String toString() {
    return '{"id":$id,"nameCity":$nameCity,"image":$image,"smallImage": $smallImage,"titleItinerary":$titleItinerary,"nbSite":$nbSite,"distance":$distance,"days":$days}';
  }
}

List<Itinerary> itineraries = [
  Itinerary(
    id: 1,
    nameCity: 'Rennes',
    titleItinerary: 'Au fil de l\'eau',
    image: 'assets/itineraryCards/route1.png',
    smallImage: 'assets/miniCardsItineraries/route1S.png',
    nbSite: 12,
    distance: 27.4,
    days: 2,
  ),
  Itinerary(
    id: 2,
    nameCity: 'Rennes',
    titleItinerary: 'Echappée gourmande',
    image: 'assets/itineraryCards/route2.png',
    smallImage: 'assets/miniCardsItineraries/route2S.png',
    nbSite: 9,
    distance: 12,
    days: 3,
  ),
  Itinerary(
    id: 3,
    nameCity: 'Rennes',
    titleItinerary: 'Flâneries médiévales au coeur de Rennes',
    image: 'assets/itineraryCards/route3.png',
    smallImage: 'assets/miniCardsItineraries/route3S.png',
    nbSite: 8,
    distance: 6,
    days: 1,
  ),
  Itinerary(
    id: 4,
    nameCity: 'Rennes',
    titleItinerary: 'Trésors historiques cachés',
    image: 'assets/itineraryCards/route4.png',
    smallImage: 'assets/miniCardsItineraries/route4S.png',
    nbSite: 15,
    distance: 19,
    days: 1,
  ),
  Itinerary(
    id: 5,
    nameCity: 'Rennes',
    titleItinerary: 'Odyssée moderne',
    image: 'assets/itineraryCards/route5.png',
    smallImage: 'assets/miniCardsItineraries/route5S.png',
    nbSite: 12,
    distance: 15,
    days: 2,
  ),
  Itinerary(
    id: 6,
    nameCity: 'Rennes',
    titleItinerary: 'Rennes en rythme',
    image: 'assets/itineraryCards/route6.png',
    smallImage: 'assets/miniCardsItineraries/route6S.png',
    nbSite: 8,
    distance: 27,
    days: 3,
  ),
];
