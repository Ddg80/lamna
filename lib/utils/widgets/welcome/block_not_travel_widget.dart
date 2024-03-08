import 'package:flutter/material.dart';
import 'package:lamna/pages/reserved/city_details_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:provider/provider.dart';

class BlockNoTravelWidget extends StatelessWidget {
  const BlockNoTravelWidget({super.key});
  @override
  Widget build(BuildContext context) {
    late final provider = Provider.of<GlobalProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pour son lancement, LÄMNA se positionne ',
          style: TextStyle(
            color: ColorConstants.blackAppColor.withOpacity(.5),
            fontSize: 14,
            fontFamily: FontConstants.interRegularFont,
            fontWeight: FontWeight.w400,
            height: 0.08,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'sur la ville de Rennes, chef-lieu de la Bretagne.',
          style: TextStyle(
            color: ColorConstants.blackAppColor.withOpacity(.5),
            fontSize: 14,
            fontFamily: FontConstants.interRegularFont,
            fontWeight: FontWeight.w400,
            height: 0.08,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/pictures/Rennes/rennes_details_page.png',
                    ),
                  ),
                ),
                height: 200.0,
              ),
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  color: ColorConstants.whiteAppColor,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      ColorConstants.greyAppColor.withOpacity(0.0),
                      ColorConstants.blackAppColor,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Rennes',
                        style: TextStyle(
                          color: ColorConstants.whiteAppColor,
                          fontSize: 24,
                          fontFamily: FontConstants.principalFont,
                          fontWeight: FontWeight.w600,
                          height: 0.05,
                        ),
                      ),
                      Container(
                        width: 137,
                        height: 22,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            provider.setIdCityChoose(1);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CityDetailsPage(id: 1),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'En savoir plus',
                                style: TextStyle(
                                  color: ColorConstants.whiteAppColor,
                                  fontSize: 16,
                                  fontFamily: FontConstants.interRegularFont,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  height: 0,
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right_outlined,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
