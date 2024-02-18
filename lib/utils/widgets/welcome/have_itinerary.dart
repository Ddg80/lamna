import 'package:flutter/material.dart';
import 'package:lamna/pages/itineraries/itineraries_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';
import 'package:provider/provider.dart';

class HaveItinerary extends StatelessWidget {
  const HaveItinerary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late final provider = Provider.of<GlobalProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vous partez à : ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.08,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    ' Rennes dans',
                    style: TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.08,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      provider.getDays().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF5A5A5A),
                        fontSize: 32,
                        fontFamily: FontConstants.regularFont,
                        fontWeight: FontWeight.w600,
                        height: 0.08,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        (provider.getDays() >= 2) ? ' Jours' : ' Jour',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF5A5A5A),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0.08,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: ButtonLarge(
              text: 'Voir les itinéraires',
              color: ColorConstants.greenUltraDarkColor,
              fontsize: 15,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ItinerariesPage(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
