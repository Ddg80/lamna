import 'package:lamna/models/place.dart';
import 'package:latlong2/latlong.dart';

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
  List<Place> places;
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
    required this.places,
    required this.createdBy,
    required this.headerImage,
    required this.description,
    required this.images,
    required this.like,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        places: [],
        id: json["id"],
        nameCity: json["nameCity"],
        image: json["image"],
        smallImage: json["smallImage"],
        titleItinerary: json["titleItinerary"],
        subtitleItinerary: json["subtitleItinerary"],
        nbSite: json["nbSite"],
        distance: json["distance"],
        days: json["days"],
        createdBy: json["createdBy"],
        headerImage: json["headerImage"],
        description: json["description"],
        images: json["images"],
        like: json["like"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameCity": nameCity,
        "image": image,
        "smallImage": smallImage,
        "titleItinerary": titleItinerary,
        "subtitleItinerary": subtitleItinerary,
        "nbSite": nbSite,
        "distance": distance,
        "days": days,
        "createdBy": createdBy,
        "headerImage": headerImage,
        "description": description,
        "images": images,
        "like": like,
      };

  @override
  String toString() {
    return '{"id":$id,"nameCity":$nameCity,"image":$image,"smallImage": $smallImage,"titleItinerary":$titleItinerary, "subtitleItinerary": $subtitleItinerary, "nbSite":$nbSite,"distance":$distance,"days":$days, "createdBy": $createdBy, "headerImage": $headerImage, "description": $description, "like": $like}';
  }
}

List<Itinerary> itineraries = [
  Itinerary(
      //[[ ---------
      like: true,
      subtitleItinerary: "",
      createdBy: "",
      headerImage: "",
      description: "",
      images: [],
      smallImage: "",
      // ---------]]
      id: 1,
      nameCity: 'Rennes',
      titleItinerary: 'Flâneries médiévales au cœur de Rennes',
      image: 'assets/itineraryCards/route1.png',
      nbSite: 8,
      distance: 6.4,
      days: 1,
      places: [
        Place(
            name: "Hôtel de Blossac",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipPXVPQ9FrB1pDfMSGp1ze2w0eut2uPZYJM6Cb4I=s48-c-h48-k-no",
            coordinate: const LatLng(48.11124907015747, -1.6819529320369127)),
        Place(
            name: "Rue du Chapitre",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipOs2wWiyWM_jr7ezrGcRFJbt1sLzg3U7pvr2faO=s48-c-h48-k-no",
            coordinate: const LatLng(48.11117083513787, -1.6822339644182203)),
        Place(
            name: "Cathédrale Saint-Pierre",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipNroNwQj5fNgWcfrBvgqG5AeWjn8ehhIQfHr18s=s48-c-h48-k-no",
            coordinate: const LatLng(48.111659842487946, -1.683288660360426)),
        Place(
            name: "Portes Mordelaises",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipNtmk-jDAZpyOwkRn-MovrakYuTAC6Bi9dQ0M66=s48-c-h48-k-no",
            coordinate: const LatLng(48.11197741728884, -1.6847505710786106)),
        Place(
            name: "Place des Lices",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipMBr0OXD2N7H5HQE-gtUKFuMzz42EMAlY-FS0Zs=s48-c-h48-k-no",
            coordinate: const LatLng(48.112631420185785, -1.683187711656832)),
        Place(
            name: "Église Saint-Melaine",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipPabaFpMZJHx9fKP1iOU89vx-kAVFqoRFJ6THch=s48-c-h48-k-no",
            coordinate: const LatLng(48.11465308121629, -1.6808268381585922)),
        Place(
            name: "Saint-Melaine Church",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipOEMtmzOrC_y3tYdvohZ0-GZfDf24VVDENs2n_L=w408-h544-k-no",
            coordinate: const LatLng(48.11476079893153, -1.6734462586562018)),
        Place(
            name: "Jardin du Thabor",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipNeeTv1mAsE5QXnWEEuQJ6AsGMhUa0bhMQxZp0=w408-h257-k-no",
            coordinate: const LatLng(48.11441745252013, -1.669492931862416)),
      ]),
];
