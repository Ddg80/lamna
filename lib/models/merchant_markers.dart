import 'package:latlong2/latlong.dart';

class MerchantMarkers {
  final String name;
  final String address;
  final LatLng location;
  final String status;
  final String image;
  final String reduction;

  MerchantMarkers(
      {required this.name,
      required this.address,
      required this.location,
      required this.status,
      required this.image,
      required this.reduction});
}

List<MerchantMarkers> merchants = [
  MerchantMarkers(
      reduction: "-8% sur l'addition",
      name: "Crêperie du Pont-Levis",
      address: "6 Rue des Portes Mordelaises, 35000 Rennes",
      location: const LatLng(48.11432433270508, -1.6696860509183444),
      status: "Ouvert",
      image:
          "https://lh5.googleusercontent.com/p/AF1QipNlEZLRW8F2-JkZRYZhL0drYH0m6CCuIVW-r1Lv=w408-h544-k-no"),
  MerchantMarkers(
      reduction: "-2% sur l'addition",
      name: "Artisans du Monde ",
      address: "16 Rue Hoche, 35000 Rennes",
      location: const LatLng(48.11352754160176, -1.6772289495637585),
      status: "Ouvert",
      image:
          "https://lh5.googleusercontent.com/p/AF1QipMt0K_-QUOkvHUBv78TRM_KGvQ0iXojivtikekz=w408-h276-k-no"),
  MerchantMarkers(
      reduction: "-12% sur l'addition",
      name: "Le Gorille Bleu",
      address: "1 Rue de la Psalette, 35000 Rennes",
      location: const LatLng(48.11118019964937, -1.6831955139532997),
      status: "Ouvert",
      image: "https://lh5.googleusercontent.com/p/AF1QipN3YOVliu3s_XvMhVzYgBUEKfuh525XTyIJPs0T=s48-w48-c-k-no"),
  MerchantMarkers(
      reduction: "-15% sur l'addition",
      name: "Mint",
      address: "12 Rue du Champ Jacquet, 35000 Rennes",
      location: const LatLng(48.113014225457405, -1.6797927588954449),
      status: "Ouvert",
      image: "https://lh5.googleusercontent.com/p/AF1QipPm4r967NPCgRSVZGxKGw84h-nNqcsO37vYrLuz=w408-h271-k-no")
];
