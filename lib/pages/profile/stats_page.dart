import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_back_widget.dart';
import 'package:lamna/utils/widgets/profile/title_statistiques.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: titleStatistiques(context),
          leading: const ButtonBackWidget(),
          backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
          elevation: 0,
          toolbarHeight: 80,
        ),
        body: Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: Text(
                "Votre activité avec l’application a un réel impact, voilà quelques chiffres sur tes différents voyages.",
                style: TextStyle(
                  color: ColorConstants.blackAppColor,
                  fontFamily: FontConstants.interRegularFont,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]));
  }
}
