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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (provider.getDays() > 0)
                      ? Text(
                          'Vous partez à : ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.greenDarkAppColor,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                          ),
                        )
                      : Text(
                          'Bien arrivé ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.greenDarkAppColor,
                            fontSize: 16,
                            fontFamily: FontConstants.semiBoldFont,
                            fontWeight: FontWeight.w700,
                            height: 0.08,
                          ),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  (provider.getDays() > 0)
                      ? Text(
                          ' Rennes dans',
                          style: TextStyle(
                            color: ColorConstants.greenDarkAppColor,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                          ),
                        )
                      : Container(),
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
                    (provider.getDays() > 0)
                        ? Text(
                            provider.getDays().toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstants.greenDarkAppColor,
                              fontSize: 32,
                              fontFamily: FontConstants.regularFont,
                              fontWeight: FontWeight.w600,
                              height: 0.08,
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 15,
                    ),
                    (provider.getDays() > 0)
                        ? Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              (provider.getDays() >= 2) ? ' Jours' : ' Jour',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorConstants.greenDarkAppColor,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0.08,
                              ),
                            ),
                          )
                        : Container(
                            transform: Matrix4.translationValues(-6, -8, 0),
                            child: Text(
                              'à destination ?',
                              style: TextStyle(
                                color: ColorConstants.greenDarkAppColor,
                                fontSize: 14,
                                fontFamily: FontConstants.lightFont,
                                fontWeight: FontWeight.w600,
                                height: 0.08,
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
          (provider.getDays() > 0)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'L’équipe LÄMNA vous',
                        style: TextStyle(
                          color: ColorConstants.greenDarkAppColor,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0.08,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'souhaite un excellent séjour !',
                        style: TextStyle(
                          color: ColorConstants.greenDarkAppColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0.08,
                        ),
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: ButtonLarge(
              text: 'Voir les itinéraires',
              color: ColorConstants.greenUltraDarkColor,
              fontsize: 14,
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
