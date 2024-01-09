import 'package:flutter/material.dart';
import 'package:lamna/pages/teaser/show_one_page.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/button_next_page_new_vision.dart';
import 'package:lamna/utils/widgets/new_vision_title.dart';
import 'package:provider/provider.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'lämna',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 40,
                color: ColorConstants.greenLightAppColor,
                fontFamily: FontConstants.principalFont,
                backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
              ),
            ),
            backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width * 0.70,
                  height: MediaQuery.of(context).size.height * 0.3,
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      const NewVisonTitle(),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: ButtonNextPageNewVison(
                          context: context,
                          page: const ShowOnePage(),
                          title: 'Commencer',
                          color: ColorConstants.greenLightAppColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/pictures/Madrid_pana.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * 0.85,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
