import 'package:flutter/material.dart';
import 'package:lamna/pages/itineraries/single_itinerary_page.dart';

class HeaderItineraryDetails extends StatelessWidget {
  const HeaderItineraryDetails({
    super.key,
    required this.widget,
  });

  final SingleItineraryPage widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          widget.itinerary.headerImage,
          height: 215,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0, left: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            child: Image.asset(
              widget.itinerary.createdBy,
            ),
          ),
        ),
      ],
    );
  }
}
