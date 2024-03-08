import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:lamna/models/merchant_markers.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProximityLayer extends StatefulWidget {
  final AttributionAlignment alignment = AttributionAlignment.bottomRight;
  final double permanentHeight = 150;
  final ItemScrollController itemScrollController;
  final Function merchantTapCallback;

  const ProximityLayer(
      {super.key,
      required this.itemScrollController,
      required this.merchantTapCallback});

  @override
  State<ProximityLayer> createState() => _ProximityLayerState();
}

class _ProximityLayerState extends State<ProximityLayer> {
  bool popupExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              popupExpanded = !popupExpanded;
            });
          },
          child: Row(
            children: [
              const Text("À proximité",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black)),
              popupExpanded
                  ? const Icon(Icons.expand_less, color: Colors.black)
                  : const Icon(Icons.keyboard_arrow_down, color: Colors.black)
            ],
          ),
        ),
        Visibility(
          visible: popupExpanded,
          child: ProximityWidgetExpanded(
              merchantTapCallback: widget.merchantTapCallback,
              permanentHeight: widget.permanentHeight,
              itemScrollController: widget.itemScrollController),
        )
      ],
    );
  }
}

class ProximityCard extends StatelessWidget {
  final double cardWidth = 200;
  final String image;
  final String name;
  final String status;
  final String distance;
  final int merchantIndex;
  final Function tapCallback;
  const ProximityCard(
      {super.key,
      required this.image,
      required this.name,
      required this.status,
      required this.distance,
      required this.merchantIndex,
      required this.tapCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapCallback(merchantIndex, () {
          Provider.of<GlobalProvider>(context, listen: false)
              .popupController
              .hideAllPopups();
        });
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (Provider.of<GlobalProvider>(context, listen: true)
                    .selectedMerchantIndex ==
                merchantIndex)
            ? 1.0
            : 0.7,
        child: SizedBox(
          width: cardWidth,
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
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
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: cardWidth / 3),
                  Text(name,
                      style: const TextStyle(
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
                        child: Text(status,
                            style: const TextStyle(
                              fontSize: 12,
                            )),
                      ),
                      Text(distance,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProximityWidgetExpanded extends StatelessWidget {
  final Function merchantTapCallback;
  final double permanentHeight;
  final ItemScrollController itemScrollController;
  const ProximityWidgetExpanded({
    super.key,
    required this.merchantTapCallback,
    required this.permanentHeight,
    required this.itemScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 0, style: BorderStyle.none),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: permanentHeight,
                child: ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: merchants.length,
                  itemScrollController: itemScrollController,
                  itemBuilder: (context, index) => ProximityCard(
                    name: merchants[index].name,
                    // TODO: use matrix distance api
                    distance: "200m",
                    status: merchants[index].status,
                    image: merchants[index].image,
                    merchantIndex: index,
                    tapCallback: merchantTapCallback,
                  ),
                ))
          ]),
    );
  }
}

class ProximityWidgetShrunken extends StatelessWidget {
  final Function onTapCallback;
  const ProximityWidgetShrunken({super.key, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text("À proximité",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black)),
        Icon(Icons.expand_less, color: Colors.black)
      ],
    );
  }
}
