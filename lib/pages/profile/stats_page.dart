import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_back_widget.dart';
import 'package:lamna/utils/widgets/cards/card_lamna.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Text(
                  "Votre activité avec l’application a un réel impact, voilà quelques chiffres sur tes différents voyages.",
                  style: TextStyle(
                    color: ColorConstants.blackAppColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CardLamna(
                        statistic: 18,
                        title: 'Commerçants ',
                        subtitle: 'remercié',
                        label: 'Bravo 🏆',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CardLamna(
                        statistic: 2,
                        title: 'Trajets effectués',
                        label: 'Un beau geste',
                        sublabel: 'pour la planète 🌍',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CardLamna(
                        statistic: 3500,
                        unity: "g",
                        title: 'de CO2 évités ! ',
                        label: 'C’est super 😍',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CardLamna(
                        statistic: 6.19,
                        unity: "km",
                        title: 'Parcourus ',
                        label: 'Encore plus la',
                        sublabel: ' prochaine fois ? 😜',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CardLamna(
                        statistic: 8,
                        title: 'Trajets en train',
                        label: 'Bravo 🏆',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CardLamna(
                        statistic: 6,
                        title: 'Parrainage',
                        label: 'Excellent 🏆',
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
