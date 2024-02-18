class Itinerary {
  late int id;
  late String nameCity;
  late String image;
  late String smallImage;
  late String titleItinerary;
  late String subtitleItinerary;
  late int nbSite;
  late double distance;
  late int days;
  late String createdBy;
  late String headerImage;
  late String description;
  late List images;
  late bool like;

  Itinerary({
    required this.id,
    required this.nameCity,
    required this.image,
    required this.smallImage,
    required this.titleItinerary,
    required this.subtitleItinerary,
    required this.nbSite,
    required this.distance,
    required this.days,
    required this.createdBy,
    required this.headerImage,
    required this.description,
    required this.images,
    required this.like,
  });

  // factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
  //       id: json["id"],
  //       nameCity: json["nameCity"],
  //       image: json["image"],
  //       smallImage: json["smallImage"],
  //       titleItinerary: json["titleItinerary"],
  //       nbSite: json["nbSite"],
  //       distance: json["distance"],
  //       days: json["days"],
  //       createdBy: json["createdBy"],
  //       headerImage: json["headerImage"],
  //       description: json["description"],
  //       images: json["images"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "nameCity": nameCity,
  //       "image": image,
  //       "smallImage": smallImage,
  //       "titleItinerary": titleItinerary,
  //       "nbSite": nbSite,
  //       "distance": distance,
  //       "days": days,
  //       "createdBy": createdBy,
  //       "headerImage": headerImage,
  //       "description": description,
  //       "images": images,
  //     };

  @override
  String toString() {
    return '{"id":$id,"nameCity":$nameCity,"image":$image,"smallImage": $smallImage,"titleItinerary":$titleItinerary, "subtitleItinerary": $subtitleItinerary, "nbSite":$nbSite,"distance":$distance,"days":$days, "createdBy": $createdBy, "headerImage": $headerImage, "description": $description, "like": $like}';
  }
}

List<Itinerary> itineraries = [
  Itinerary(
    id: 1,
    nameCity: 'Rennes',
    titleItinerary: 'Rennes ',
    subtitleItinerary: 'au fil de l\'eau',
    image: 'assets/itineraryCards/route1.png',
    smallImage: 'assets/miniCardsItineraries/route1S.png',
    nbSite: 12,
    distance: 27.4,
    days: 2,
    createdBy: "assets/labelsItineraries/createdByDestinationRennes.png",
    headerImage: "assets/auFilDeLeau/header.png",
    description:
        "Explorez Rennes à travers ses cours d'eau, découvrant ses quais pittoresques et ses parcs verdoyants bordés d'eau, offrant une perspective paisible de la ville.",
    images: [
      "assets/auFilDeLeau/image1.png",
      "assets/auFilDeLeau/image2.png",
      "assets/auFilDeLeau/image3.png",
      "assets/auFilDeLeau/image4.png"
    ],
    like: false,
  ),
  Itinerary(
    id: 2,
    nameCity: 'Rennes',
    titleItinerary: 'Echappée ',
    subtitleItinerary: 'gourmande',
    image: 'assets/itineraryCards/route2.png',
    smallImage: 'assets/miniCardsItineraries/route2S.png',
    nbSite: 9,
    distance: 12,
    days: 3,
    createdBy: "assets/labelsItineraries/createdByLamna.png",
    headerImage: "assets/EchappeGourmande/header.png",
    description:
        "Laissez-vous séduire par les délices culinaires de Rennes en explorant ses marchés animés, ses rues pavées bordées de restaurants et ses places accueillantes, offrant une expérience gastronomique inoubliable.",
    images: [
      "assets/EchappeGourmande/image1.png",
      "assets/EchappeGourmande/image2.png",
      "assets/EchappeGourmande/image3.png",
      "assets/EchappeGourmande/image4.png"
    ],
    like: false,
  ),
  Itinerary(
    id: 3,
    nameCity: 'Rennes',
    titleItinerary: 'Flâneries médiévales ',
    subtitleItinerary: 'au coeur de Rennes',
    image: 'assets/itineraryCards/route3.png',
    smallImage: 'assets/miniCardsItineraries/route3S.png',
    nbSite: 8,
    distance: 6,
    days: 1,
    createdBy: "assets/labelsItineraries/createdByNosCurieuxVoyageurs.png",
    headerImage: "assets/medieval/header.png",
    description:
        "Plongez dans une expérience immersive à travers les ruelles médiévales de Rennes, où chaque pas vous transporte dans l'atmosphère envoûtante du Moyen Âge. Parcourez les chemins pavés qui ont vu défiler les chevaliers et les marchands, imprégnant chaque pierre d'une histoire millénaire.",
    images: [
      "assets/medieval/image1.png",
      "assets/medieval/image2.png",
      "assets/medieval/image3.png",
      "assets/medieval/image4.png"
    ],
    like: false,
  ),
  Itinerary(
    id: 4,
    nameCity: 'Rennes',
    titleItinerary: 'Trésors ',
    subtitleItinerary: 'historiques cachés',
    image: 'assets/itineraryCards/route4.png',
    smallImage: 'assets/miniCardsItineraries/route4S.png',
    nbSite: 15,
    distance: 19,
    days: 1,
    createdBy: "assets/labelsItineraries/createdByBrunoMaltor.png",
    headerImage: "assets/tresorsCaches/header.png",
    description:
        "Plongez dans le riche passé de Rennes en explorant ses trésors historiques cachés, des églises anciennes aux ruelles médiévales, en passant par les imposants bâtiments de la période de la Renaissance.",
    images: [
      "assets/tresorsCaches/image1.png",
      "assets/tresorsCaches/image2.png",
      "assets/tresorsCaches/image3.png"
    ],
    like: false,
  ),
  Itinerary(
    id: 5,
    nameCity: 'Rennes',
    titleItinerary: 'Une Odyssée ',
    subtitleItinerary: 'moderne',
    image: 'assets/itineraryCards/route5.png',
    smallImage: 'assets/miniCardsItineraries/route5S.png',
    nbSite: 12,
    distance: 15,
    days: 2,
    createdBy: "assets/labelsItineraries/createdByDestinationRennes.png",
    headerImage: "assets/odysseModerne/header.png",
    description:
        "Découvrez le visage contemporain de Rennes à travers ses bâtiments modernes et ses quartiers dynamiques, témoignant de son évolution urbaine et de son engagement envers l'innovation architecturale.",
    images: [
      "assets/odysseModerne/image1.png",
      "assets/odysseModerne/image2.png",
      "assets/odysseModerne/image3.png",
      "assets/odysseModerne/image4.png"
    ],
    like: false,
  ),
  Itinerary(
    id: 6,
    nameCity: 'Rennes',
    titleItinerary: 'Rennes ',
    subtitleItinerary: 'en rythme',
    image: 'assets/itineraryCards/route6.png',
    smallImage: 'assets/miniCardsItineraries/route6S.png',
    nbSite: 8,
    distance: 27,
    days: 3,
    createdBy: "assets/labelsItineraries/createdByLamna.png",
    headerImage: "assets/enRythme/header.png",
    description:
        "Vibrez au son de Rennes en découvrant ses lieux de musique emblématiques, des salles de concert animées aux bars intimistes, offrant une expérience musicale variée et dynamique.",
    images: [
      "assets/enRythme/image1.png",
      "assets/enRythme/image2.png",
      "assets/enRythme/image3.png",
    ],
    like: false,
  ),
];
