import 'package:flutter/material.dart';
import 'package:lamna/models/itinerary.dart';

class HeaderItineraryDetails extends StatelessWidget {
  final Itinerary itinerary;
  const HeaderItineraryDetails({
    super.key,
    required this.itinerary,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          itinerary.headerImage,
          height: 215,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0, left: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            child: Image.asset(
              itinerary.createdBy,
            ),
          ),
        ),
      ],
    );
  }
}
