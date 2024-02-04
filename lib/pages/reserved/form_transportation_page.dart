import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/reserved/title_reserved.dart';

class FormTransportationPage extends StatefulWidget {
  const FormTransportationPage({super.key});

  @override
  State<FormTransportationPage> createState() => _FormTransportationPageState();
}

class _FormTransportationPageState extends State<FormTransportationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            transform: Matrix4.translationValues(-38, 0, 0),
            child: const TitleReserved()),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                  'Confirme les informations qui concerne les modalités du moyen de transport.'),
            ),
          ),
        ],
      ),
    );
  }
}
