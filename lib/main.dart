import 'package:flutter/material.dart';
import 'package:lamna/pages/teaser/launcher_page.dart';
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
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: ColorConstants.greenDarkAppColor,
          ),
          colorScheme: ColorScheme(
            background: ColorConstants.lightScaffoldBackgroundColor,
            onBackground: ColorConstants.lightScaffoldBackgroundColor,
            primary: ColorConstants.greenDarkAppColor,
            secondary: ColorConstants.greenLightAppColor,
            error: ColorConstants.redBlurSecondaryColor,
            surface: ColorConstants.cardBgLightColor,
            onSurface: ColorConstants.blackAppColor,
            brightness: Brightness.dark,
            onSecondary: ColorConstants.greenLightAppColor,
            onError: ColorConstants.redBlurSecondaryColor,
            onPrimary: ColorConstants.blackAppColor,
          ),
        ),
        home: const LauncherPage(),
      ),
    );
  }
}
