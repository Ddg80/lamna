import 'package:latlong2/latlong.dart';

class MapConstants {
  static const String mapBoxUrlTemplate =
      "https://api.mapbox.com/styles/v1/tr-/clt7pj4cr00dg01nw4fq0b16y/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidHItIiwiYSI6ImNsdDdwYzJ6bjBtMjAyaW05cGs4dnAzMnUifQ.-AZ7a-7sbUl8wD71EwMBZw";
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoidHItIiwiYSI6ImNsdDdwYzJ6bjBtMjAyaW05cGs4dnAzMnUifQ.-AZ7a-7sbUl8wD71EwMBZw';
  static const String mapBoxStyleId = 'clt7pj4cr00dg01nw4fq0b16y';
  static const String openRouteServiceApiKey = '';
  static const String openRouteServiceBaseUrl = 'https://osrm.lamna.app/ors';

  static const LatLng defaultCenter = LatLng(48.117266, -1.6777926);
  static const double defaultZoom = 9.2;
  static const double maxZoomOnTap = 15;
}
