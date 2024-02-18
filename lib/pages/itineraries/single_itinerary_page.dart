import 'package:flutter/material.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class SingleItineraryPage extends StatefulWidget {
  final Itinerary itinerary;
  const SingleItineraryPage({super.key, required this.itinerary});

  @override
  State<SingleItineraryPage> createState() => _SingleItineraryPageState();
}

class _SingleItineraryPageState extends State<SingleItineraryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.itinerary);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: const Text('Single Itineray page'),
    );
  }
}
