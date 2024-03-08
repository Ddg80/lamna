import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:provider/provider.dart';

class QrCodeLayer extends StatefulWidget {
  final AttributionAlignment alignment = AttributionAlignment.bottomRight;
  final double permanentHeight = 300;

  const QrCodeLayer({super.key});

  @override
  State<QrCodeLayer> createState() => _QrCodeLayerState();
}

class _QrCodeLayerState extends State<QrCodeLayer> {
  @override
  Widget build(BuildContext context) {
    return TapRegion(
        onTapOutside: (tap) {
          Provider.of<GlobalProvider>(context, listen: false)
              .setToggleQrCode(false);
        },
        child: GestureDetector(
          onTap: () {
            Provider.of<GlobalProvider>(context, listen: false).toggleQrCode();
          },
          child: Align(
            alignment: Alignment.bottomRight,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: ClipOval(
                      child: Container(
                          // padding: const EdgeInsets.all(16),
                          width: 70,
                          height: 70,
                          color: Colors.white,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.qr_code,
                                  size: 25, color: Colors.black),
                              Text("MON", style: TextStyle(fontSize: 8)),
                              Text("QRCODE", style: TextStyle(fontSize: 8))
                            ],
                          ))),
                ),
              ],
            ),
          ),
        ));
  }
}
