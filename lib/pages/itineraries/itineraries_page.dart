import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/itineraries/title_itineraries.dart';

class ItinerariesPage extends StatefulWidget {
  const ItinerariesPage({super.key});

  @override
  State<ItinerariesPage> createState() => _ItinerariesPageState();
}

class _ItinerariesPageState extends State<ItinerariesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleItineraries(context),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 18.0),
              child: Row(
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Itinéraires',
                          style: TextStyle(
                            color: Color(0xFF3C674C),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                          ),
                        ),
                        TextSpan(
                          text: ' sauvegardés',
                          style: TextStyle(
                            color: Color(0xFF3C674C),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0.08,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset('assets/icons/heart.svg'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
