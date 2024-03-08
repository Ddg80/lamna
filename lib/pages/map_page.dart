import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/models/merchant_markers.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/map_constants.dart';
import 'package:lamna/utils/widgets/map/marker_popup.dart';
import 'package:lamna/utils/widgets/map/proximity_layer.dart';
import 'package:lamna/utils/widgets/map/qr_code_layer.dart';

import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:path_provider/path_provider.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key});
  final OpenRouteService client = OpenRouteService(
      baseUrl: MapConstants.openRouteServiceBaseUrl,
      apiKey: MapConstants.openRouteServiceApiKey,
      defaultProfile: ORSProfile.drivingCar);

  Future<Polyline> _getPolyline(
      LatLng startCoordinate, LatLng endCoordinate) async {
    final List<ORSCoordinate> routeCoordinates =
        await client.directionsRouteCoordsGet(
      startCoordinate: ORSCoordinate(
          latitude: startCoordinate.latitude,
          longitude: startCoordinate.longitude),
      endCoordinate: ORSCoordinate(
          latitude: endCoordinate.latitude, longitude: endCoordinate.longitude),
    );
    final List<LatLng> routePoints = routeCoordinates
        .map((coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
        .toList();

    final Polyline routePolyline = Polyline(
      points: routePoints,
      color: ColorConstants.greenLightAppColor,
      strokeWidth: 4,
    );
    return routePolyline;
  }

  List<Future<Polyline>> _getCoordinatesPolylines(
      LatLng startLatLng, List<LatLng> stopsCoordinates) {
    List<Future<Polyline>> itinerary = [];
    for (var i = 0; i < stopsCoordinates.length; i++) {
      if (i == 0) {
        // itinerary.add(_getPolyline(stopsCoordinates[i], stopsCoordinates[i]));
        itinerary.add(_getPolyline(startLatLng, stopsCoordinates[i]));
      } else {
        itinerary
            .add(_getPolyline(stopsCoordinates[i - 1], stopsCoordinates[i]));
      }
    }
    return itinerary;
  }

  List<Marker> _getCoordinatesMarkers(List<LatLng> stopsCoordinates) {
    List<Marker> markers = [];
    for (var i = 0; i < stopsCoordinates.length; i++) {
      markers.add(Marker(
          point: stopsCoordinates[i],
          width: 80,
          height: 80,
          child: Icon(Icons.location_on,
              color: ColorConstants.greenDarkAppColor)));
    }
    return markers;
  }

  Future<List<Polyline>> _getRoutingPolylinesByItineraryId(
      LatLng startLatLng, int id) async {
    try {
      Itinerary itinerary = itineraries.singleWhere((el) => el.id == id);
      return Future.wait(_getCoordinatesPolylines(
          startLatLng, itinerary.places.map((el) => el.coordinate).toList()));
    } catch (error) {
      log("routing polylines error ${error.toString()}");
      return [];
    }
  }

  List<Marker> _getRoutingMarkersByItineraryId(int id) {
    try {
      Itinerary itinerary = itineraries.singleWhere((e) => e.id == id);
      return _getCoordinatesMarkers(
          itinerary.places.map((el) => el.coordinate).toList());
    } catch (error) {
      log("routing markers error ${error.toString()}");
      return [];
    }
  }

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  List<Future<Polyline>> itineraryPolylines = [];
  List<Marker> itineraryMarkers = [];

  ItemScrollController itemScrollController = ItemScrollController();

  LatLng currentLatLng = MapConstants.defaultCenter;
  late final Stream<LocationMarkerPosition?> _positionStream;

  @override
  void initState() {
    super.initState();
    const factory = LocationMarkerDataStreamFactory();
    _positionStream =
        factory.fromGeolocatorPositionStream().asBroadcastStream();
    _positionStream.listen((event) {
      //TODO: fix wrong currnetlatlng ?!
      if (event != null) {
        currentLatLng = event.latLng;
      }
      log(event.toString());
    });
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: Provider.of<GlobalProvider>(context, listen: false)
            .mapController
            .camera
            .center
            .latitude,
        end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: Provider.of<GlobalProvider>(context, listen: false)
            .mapController
            .camera
            .center
            .longitude,
        end: destLocation.longitude);
    final zoomTween = Tween<double>(
        begin: Provider.of<GlobalProvider>(context, listen: false)
            .mapController
            .camera
            .zoom,
        end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    var controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      Provider.of<GlobalProvider>(context, listen: false).mapController.move(
            LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
            zoomTween.evaluate(animation),
          );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  merchantTapCallback(int index, [Function? after]) {
    if (Provider.of<GlobalProvider>(context, listen: false)
                .selectedItineraryId !=
            null &&
        Provider.of<GlobalProvider>(context, listen: false).itineraryStarted ==
            true) {
      itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 250),
      );
    }
    Provider.of<GlobalProvider>(context, listen: false)
        .setSelectedMerchantIndex(index);
    currentLatLng = merchants[index].location;
    var currentZoom = Provider.of<GlobalProvider>(context, listen: false)
        .mapController
        .camera
        .zoom;
    log("Current: $currentZoom Max: ${MapConstants.maxZoomOnTap}");
    _animatedMapMove(
        currentLatLng,
        currentZoom < MapConstants.maxZoomOnTap
            ? MapConstants.maxZoomOnTap
            : currentZoom);
    after?.call();
    setState(() {});
  }

  // create the cache store as a field variable
  final Future<CacheStore> _cacheStoreFuture = _getCacheStore();

  /// Get the CacheStore as a Future. This method needs to be static so that it
  /// can be used to initialize a field variable.
  static Future<CacheStore> _getCacheStore() async {
    final dir = await getTemporaryDirectory();
    // Note, that Platform.pathSeparator from dart:io does not work on web,
    // import it from dart:html instead.
    return FileCacheStore('${dir.path}${Platform.pathSeparator}MapTiles');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FutureBuilder(
          future: _cacheStoreFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final cacheStore = snapshot.data!;
              return FlutterMap(
                mapController:
                    Provider.of<GlobalProvider>(context, listen: true)
                        .mapController,
                options: MapOptions(
                    onTap: (_, __) {
                      Provider.of<GlobalProvider>(context, listen: false)
                          .popupController
                          .hideAllPopups();
                      // if (Provider.of<GlobalProvider>(context)
                      //         .selectedMerchantIndex !=
                      //     null) {
                      //   Provider.of<GlobalProvider>(context, listen: false)
                      //       .setSelectedMerchantIndex(null);
                      // }
                    },
                    minZoom: 5,
                    maxZoom: 18,
                    initialZoom: MapConstants.defaultZoom,
                    initialCenter: currentLatLng),
                children: [
                  TileLayer(
                    // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    // userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    urlTemplate: MapConstants.mapBoxUrlTemplate,
                    additionalOptions: const {
                      // 'id': MapConstants.mapBoxStyleId,
                      'mapStyleId': MapConstants.mapBoxStyleId,
                      'accessToken': MapConstants.mapBoxAccessToken
                    },

                    tileProvider: CachedTileProvider(
                      // use the store for your CachedTileProvider instance
                      store: cacheStore,
                    ),
                  ),
                  CurrentLocationLayer(
                    positionStream: _positionStream,
                    alignPositionOnUpdate: AlignOnUpdate.never,
                    alignDirectionOnUpdate: AlignOnUpdate.never,
                    style: LocationMarkerStyle(
                      // headingSectorColor: ColorConstants.yellowPrimaryAppColor,
                      // accuracyCircleColor: Color(0xE0f0e4d0),
                      marker: DefaultLocationMarker(
                        color: ColorConstants.yellowPrimaryAppColor,
                        child: const Icon(
                          Icons.navigation,
                          color: Colors.white,
                        ),
                      ),
                      markerSize: const Size(40, 40),
                      markerDirection: MarkerDirection.heading,
                    ),
                  ),
                  if (Provider.of<GlobalProvider>(context, listen: true)
                          .selectedItineraryId !=
                      null)
                    FutureBuilder(
                        future: widget._getRoutingPolylinesByItineraryId(
                            //TODO: fix and use current position
                            MapConstants.defaultCenter,
                            // currentLatLng,
                            Provider.of<GlobalProvider>(context)
                                .selectedItineraryId!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData && !snapshot.hasError) {
                            return PolylineLayer(
                              polylines: snapshot.data!,
                            );
                          } else {
                            log("future builder error ${snapshot.error}");
                            return Container();
                          }
                        }),
                  if (Provider.of<GlobalProvider>(context, listen: true)
                          .selectedItineraryId !=
                      null)
                    MarkerLayer(
                        // markers: routingMarkers,
                        markers: widget._getRoutingMarkersByItineraryId(
                            Provider.of<GlobalProvider>(context, listen: true)
                                .selectedItineraryId!)),
                  // Markers for merchants
                  PopupMarkerLayer(
                    options: PopupMarkerLayerOptions(
                        popupController:
                            Provider.of<GlobalProvider>(context, listen: true)
                                .popupController,
                        markers: [
                          for (int index = 0; index < merchants.length; index++)
                            Marker(
                                key: ValueKey(index),
                                height: 40,
                                width: 40,
                                point: merchants[index].location,
                                child: AnimatedScale(
                                  duration: const Duration(milliseconds: 250),
                                  scale: Provider.of<GlobalProvider>(context,
                                                  listen: true)
                                              .selectedMerchantIndex ==
                                          index
                                      ? 1
                                      : 0.8,
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 250),
                                    opacity: Provider.of<GlobalProvider>(
                                                    context,
                                                    listen: true)
                                                .selectedMerchantIndex ==
                                            index
                                        ? 1
                                        : 0.5,
                                    child: Image.asset(
                                      'assets/icons/merchant_marker.png',
                                    ),
                                  ),
                                )),
                        ],
                        popupDisplayOptions: PopupDisplayOptions(
                          builder: (BuildContext context, Marker marker) =>
                              MerchantMarkerPopup(marker),
                        ),
                        onPopupEvent: (event, selectedMarkers) {
                          if (selectedMarkers.isNotEmpty) {
                            merchantTapCallback(
                                (selectedMarkers[0].key as ValueKey).value);
                          }
                        }),
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return const Center(child: CircularProgressIndicator());
          }),
      if (Provider.of<GlobalProvider>(context, listen: true)
              .selectedItineraryId !=
          null)
        Positioned(
            /* status bar padding */
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).viewPadding.top,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PageView.builder(
                controller: Provider.of<GlobalProvider>(context, listen: true)
                    .pageController,
                itemCount: (Provider.of<GlobalProvider>(context, listen: true)
                        .getSelectedItinerary()
                        .places
                        .length +
                    1),
                itemBuilder: (context, index) {
                  Itinerary selectedItinerary =
                      Provider.of<GlobalProvider>(context, listen: true)
                          .getSelectedItinerary();
                  if (index == 0) {
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    Provider.of<GlobalProvider>(context,
                                            listen: true)
                                        .getSelectedItinerary()
                                        .places
                                        .first
                                        .name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: ColorConstants.greenDarkAppColor,
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                          color:
                                              ColorConstants.greenLightAppColor,
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/icons/distance.png'),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 4.0),
                                              child: Text("8,7 km"),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0, horizontal: 8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                            color: ColorConstants
                                                .greenLightAppColor,
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  'assets/icons/travel_time.png'),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4.0),
                                                child: Text("4h30"),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(selectedItinerary.image)
                          ],
                        ),
                      ),
                    );
                  }
                  return Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Prochain lieu :",
                                  style: TextStyle(
                                    color: ColorConstants.greyAppColor,
                                  )),
                              Text(selectedItinerary.places[index - 1].name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: ColorConstants.greenDarkAppColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              selectedItinerary.places[index - 1].image,
                              width: MediaQuery.of(context).size.width / 3,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return const Text('No internet access !');
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
      Positioned(
        left: 0.0,
        right: 0.0,
        bottom: 0.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    Provider.of<GlobalProvider>(context, listen: false)
                        .mapController
                        .move(MapConstants.defaultCenter,
                            MapConstants.defaultZoom);
                  });
                },
                icon: const Icon(Icons.center_focus_strong_rounded),
              ),
              IconButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    int randomNumber =
                        math.Random().nextInt(itineraries.length);
                    /* itineraries id's start at 1 */
                    randomNumber++;
                    log("Itineraries length : ${itineraries.length} Random Index : ${randomNumber.toString()}");
                    Provider.of<GlobalProvider>(context, listen: false)
                        .setSelectedItineraryId(randomNumber);
                  },
                  icon: const Icon(Icons.radar)),
              IconButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Provider.of<GlobalProvider>(context, listen: false)
                      .setSelectedItineraryId(null);
                  Provider.of<GlobalProvider>(context, listen: false)
                      .setItineraryStarted(false);
                },
                icon: const Icon(Icons.wrong_location_rounded),
              ),
              IconButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    _animatedMapMove(
                        currentLatLng,
                        Provider.of<GlobalProvider>(context, listen: false)
                            .mapController
                            .camera
                            .zoom);
                  },
                  icon: const Icon(Icons.adjust)),
              const QrCodeLayer(),
              if ((Provider.of<GlobalProvider>(context, listen: true)
                          .itineraryStarted ==
                      true) &&
                  (Provider.of<GlobalProvider>(context, listen: true)
                          .selectedItineraryId !=
                      null))
                ProximityLayer(
                    itemScrollController: itemScrollController,
                    merchantTapCallback: merchantTapCallback),
            ]),
      ),
      if (Provider.of<GlobalProvider>(context, listen: true).qrCodeToggled ==
          true)
        Positioned.fill(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 1.5,
              minWidth: MediaQuery.of(context).size.width / 1.5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0, style: BorderStyle.none),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            RichText(
                              text: TextSpan(
                                text: '',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Montre ton QR Code',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstants.greenDarkAppColor,
                                    ),
                                  ),
                                  const TextSpan(text: ' à un'),
                                ],
                              ),
                            ),
                            const Text("commerçant partenaire"),
                            const Text("pour bénéficier d'une"),
                            RichText(
                              text: TextSpan(
                                  text: '',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'réduction',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.greenDarkAppColor,
                                      ),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              child: QrImageView(
                                data: '1234567890',
                                version: QrVersions.auto,
                                size: 200.0,
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ClipOval(
                      child: Container(
                        color: ColorConstants.greenDarkAppColor,
                        width: 40,
                        height: 40,
                        child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => {
                                  Provider.of<GlobalProvider>(context,
                                          listen: false)
                                      .setToggleQrCode(false)
                                }),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      Positioned(
          bottom: 0.0,
          width: MediaQuery.of(context).size.width,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: ((Provider.of<GlobalProvider>(context, listen: true)
                            .selectedItineraryId !=
                        null) &&
                    (Provider.of<GlobalProvider>(context, listen: true)
                            .itineraryStarted ==
                        false))
                ? 1.0
                : 0.0,
            child: IgnorePointer(
              ignoring: ((Provider.of<GlobalProvider>(context, listen: true)
                              .selectedItineraryId !=
                          null) &&
                      (Provider.of<GlobalProvider>(context, listen: true)
                              .itineraryStarted ==
                          false))
                  ? false
                  : true,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 16.0, left: 16.0, bottom: 16.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: ColorConstants.greenDarkAppColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Provider.of<GlobalProvider>(context,
                                      listen: false)
                                  .setItineraryStarted(true);
                              if (Provider.of<GlobalProvider>(context,
                                      listen: false)
                                  .getSelectedItinerary()
                                  .places
                                  .isNotEmpty) {
                                Provider.of<GlobalProvider>(context,
                                        listen: false)
                                    .pageController
                                    .animateToPage(1,
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.easeIn);
                              }
                            },
                            child: const Text(
                              "Commencer ma visite",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child:
                                Icon(Icons.arrow_forward, color: Colors.white),
                          )
                        ],
                      ),
                    )),
              ),
            ),
          )),
    ]));
  }
}
