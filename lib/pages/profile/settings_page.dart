import 'package:flutter/material.dart';
import 'package:lamna/models/setting.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_back_widget.dart';
import 'package:lamna/utils/widgets/cards/card_lamna_large.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final provider = Provider.of<GlobalProvider>(context, listen: false);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Setting> settings = provider.getSettings();
    final Setting logout = provider.getLogoutSettings();

    return Scaffold(
      appBar: AppBar(
        leading: const ButtonBackWidget(),
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 25,
            color: ColorConstants.greenDarkAppColor,
            fontFamily: FontConstants.principalFont,
          ),
        ),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            for (var i = 0; i < settings.length; i++)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CardLamnaLarge(
                  id: settings[i].id,
                  pictureSVG: settings[i].pictureSVG,
                  title: settings[i].title,
                  subtitle: settings[i].subtitle,
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CardLamnaLarge(
            id: logout.id,
            pictureSVG: logout.pictureSVG,
            title: logout.title,
            subtitle: logout.subtitle,
          ),
        ),
      ),
    );
  }
}
