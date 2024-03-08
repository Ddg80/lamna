import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HistoriqueQrCodes extends StatefulWidget {
  const HistoriqueQrCodes({super.key});

  @override
  State<HistoriqueQrCodes> createState() => _HistoriqueQrCodesState();
}

class _HistoriqueQrCodesState extends State<HistoriqueQrCodes> {
  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Liste des QR Codes scannés"),
          backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        ),
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Voyageur : ${faker.person.name()}"),
                          Text(
                              "Date : ${faker.date.month()} ${faker.date.year(minYear: 2023, maxYear: 2024)}"),
                        ],
                      ),
                      QrImageView(
                        data: faker.randomGenerator.string(10),
                        version: QrVersions.auto,
                        size: 50,
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
