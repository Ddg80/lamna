import 'package:flutter/material.dart';
import 'package:lamna/pages/city_details_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class CardDestination extends StatelessWidget {
  const CardDestination({
    Key? key,
    required this.id,
    required this.picture,
    required this.enable,
    required this.name,
    required this.label,
    required this.subtitle,
  }) : super(key: key);

  final int id;
  final String picture;
  final bool enable;
  final String name;
  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (enable) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CityDetailsPage(id: id),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: ShapeDecoration(
            color: ColorConstants.whiteAppColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(31),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 116,
                height: 150,
                child: Image.asset(picture, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (enable)
                        ? Container(
                            decoration: ShapeDecoration(
                              color: ColorConstants.yellowPrimaryAppColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications_active_outlined,
                                    color: ColorConstants.whiteAppColor,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    label,
                                    style: TextStyle(
                                        color: ColorConstants.whiteAppColor,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF3B6B4E),
                        fontSize: 24,
                        fontFamily: 'Clash Display Variable',
                        fontWeight: FontWeight.w600,
                        height: 0.04,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300 * 0.65,
                      height: 80,
                      child: Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                            color: Color(0xFF3B3B3B),
                            fontSize: 14,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
