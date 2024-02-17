import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/pages/itineraries/itineraries_page.dart';
import 'package:lamna/pages/map/map_page.dart';
import 'package:lamna/pages/profile_page.dart';
import 'package:lamna/pages/welcome/welcome_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    const WelcomePage(),
    const MapPage(),
    const ItinerariesPage(),
    const ProfilePage()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorConstants.whiteAppColor,
        selectedItemColor: ColorConstants.greenDarkAppColor,
        unselectedItemColor: ColorConstants.greyAppColor,
        iconSize: 24,
        selectedFontSize: 17,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? SvgPicture.asset('assets/menu-icons/home.svg')
                : SvgPicture.asset('assets/menu-icons/homeDisabled.svg'),
            label: 'Accueil',
            backgroundColor: currentIndex == 0
                ? ColorConstants.greenLightAppColor
                : ColorConstants.greyAppColor,
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? SvgPicture.asset('assets/menu-icons/map.svg')
                : SvgPicture.asset('assets/menu-icons/mapDisabled.svg'),
            label: 'Carte',
            backgroundColor: currentIndex == 1
                ? ColorConstants.greenLightAppColor
                : ColorConstants.greyAppColor,
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? SvgPicture.asset('assets/menu-icons/route.svg')
                : SvgPicture.asset('assets/menu-icons/routeDisabled.svg'),
            label: 'Itinéraires',
            backgroundColor: currentIndex == 2
                ? ColorConstants.greenLightAppColor
                : ColorConstants.greyAppColor,
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? SvgPicture.asset('assets/menu-icons/user.svg')
                : SvgPicture.asset('assets/menu-icons/userDisabled.svg'),
            label: 'Profil',
            backgroundColor: currentIndex == 3
                ? ColorConstants.greenLightAppColor
                : ColorConstants.greyAppColor,
          ),
        ],
      ),
    );
  }
}
