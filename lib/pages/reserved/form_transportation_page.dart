import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/reserved/title_reserved.dart';

class FormTransportationPage extends StatefulWidget {
  const FormTransportationPage({super.key});

  @override
  State<FormTransportationPage> createState() => _FormTransportationPageState();
}

class _FormTransportationPageState extends State<FormTransportationPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController startCityController = TextEditingController();
  TextEditingController finishCityController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();
  TextEditingController numbersTravelController = TextEditingController();
  bool enable = false;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'Confirme les informations qui concerne les modalités du moyen de transport.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: FontConstants.regularFont,
                  ),
                ),
              ),
            ),
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text(
                            'Trajet',
                            style: TextStyle(
                              fontFamily: FontConstants.principalFont,
                              color: ColorConstants.greenDarkAppColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          hintText: 'Ville de départ...'),
                    ),
                    TextFormField(
                      controller: startCityController,
                      decoration: InputDecoration(
                        hintText: 'Ville de départ...',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: FontConstants.regularFont),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (data) {
                        if (startCityController.text.isEmpty) {
                          enable = false;
                        } else {
                          enable = true;
                        }
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Merci de renseigner une ville de départ email valide.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
