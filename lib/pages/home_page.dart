import 'package:flutter/material.dart';
import 'package:lamna/pages/destination_page.dart';
import 'package:lamna/pages/profile_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    const Center(child: Text('Carte', style: TextStyle(fontSize: 60))),
    const DestinationPage(),
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
        unselectedItemColor: ColorConstants.greenLightAppColor,
        iconSize: 24,
        selectedFontSize: 17,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.map_outlined),
            label: 'Carte',
            backgroundColor: ColorConstants.greenLightAppColor,
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.swap_calls_outlined),
              label: 'Itinéraires',
              backgroundColor: ColorConstants.greenLightAppColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_2_outlined),
              label: 'Profil',
              backgroundColor: ColorConstants.greenLightAppColor),
        ],
      ),
    );
  }
}
