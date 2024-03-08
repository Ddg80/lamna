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
      id: 2,
      nameCity: 'Rennes',
      titleItinerary: 'Flâneries médiévales au coeur de Rennes',
      image: 'assets/itineraryCards/route3.png',
      nbSite: 8,
      distance: 6,
      days: 1,
      places: [
        Place(
            name: "Demo place 20",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.105214552043954, -1.7112716175587777)),
        Place(
            name: "Demo place 21",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.09245481192589, -1.6462449857805834)),
      ]),
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
      id: 3,
      nameCity: 'Rennes',
      titleItinerary: 'Flâneries médiévales au coeur de Rennes',
      image: 'assets/itineraryCards/route3.png',
      nbSite: 8,
      distance: 6,
      days: 1,
      places: [
        Place(
            name: "Demo place 20",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.105214552043954, -1.7112716175587777)),
        Place(
            name: "Demo place 21",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.09245481192589, -1.6462449857805834)),
      ]),
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
      id: 4,
      nameCity: 'Rennes',
      titleItinerary: 'Trésors historiques cachés',
      image: 'assets/itineraryCards/route4.png',
      nbSite: 15,
      distance: 19,
      days: 1,
      places: [
        Place(
            name: "Demo place 8",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.13054497505201, -1.656197115798586)),
        Place(
            name: "Demo place 9",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.13656191725825, -1.6070935116964642)),
        Place(
            name: "Demo place 10",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.11742691669266, -1.594390569350951)),
        Place(
            name: "Demo place 11",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.09495997780831, -1.5904423575408588)),
      ]),
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
      id: 5,
      nameCity: 'Rennes',
      titleItinerary: 'Odyssée moderne',
      image: 'assets/itineraryCards/route5.png',
      nbSite: 12,
      distance: 15,
      days: 2,
      places: [
        Place(
            name: "Demo place 12",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.15351392345713, -1.6747280966171703)),
        Place(
            name: "Demo place 13",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.15042174526032, -1.6589352493768024)),
        Place(
            name: "Demo place 14",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.12235457438159, -1.6388508675602476)),
      ]),
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
      id: 6,
      nameCity: 'Rennes',
      titleItinerary: 'Rennes en rythme',
      image: 'assets/itineraryCards/route6.png',
      nbSite: 8,
      distance: 27,
      days: 3,
      places: [
        Place(
            name: "Demo place 15",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.100647701332306, -1.6408134614318093)),
        Place(
            name: "Demo place 16",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.088668705116845, -1.6420130519520133)),
        Place(
            name: "Demo place 17",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.086489998883266, -1.629653432372595)),
        Place(
            name: "Demo place 18",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.098414418785005, -1.6013293041697614)),
        Place(
            name: "Demo place 19",
            image:
                "https://lh5.googleusercontent.com/p/AF1QipP94Cf5_StSoPgNfRKTm4SccJqYLVxRqYCz71ef=w408-h306-k-no",
            coordinate: const LatLng(48.065365054818386, -1.603166328797821)),
      ]),
];
