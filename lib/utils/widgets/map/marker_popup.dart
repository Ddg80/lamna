import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:lamna/models/merchant_markers.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:provider/provider.dart';

class MerchantMarkerPopup extends StatefulWidget {
  final Marker marker;

  const MerchantMarkerPopup(this.marker, {super.key});

  @override
  State<StatefulWidget> createState() => _MerchantMarkerPopupState();
}

class _MerchantMarkerPopupState extends State<MerchantMarkerPopup> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _cardDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _cardDescription(BuildContext context) {
    int selectedMerchant = Provider.of<GlobalProvider>(context, listen: true)
        .selectedMerchantIndex!;
    const double minWidth = 100;
    const double maxWidth = 200;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: ConstrainedBox(
        constraints:
            const BoxConstraints(minWidth: minWidth, maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(merchants[selectedMerchant].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: maxWidth / 3),
              Text(merchants[selectedMerchant].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFF3B6B4F),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: ColorConstants.greenBlurSecondaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Image.asset("assets/icons/travel_time.png"),
                        ),
                        Text(merchants[selectedMerchant].status,
                            style: const TextStyle(
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Text(merchants[selectedMerchant].reduction,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.yellowPrimaryAppColor)),
            ],
          ),
        ),
      ),
    );
  }
}
