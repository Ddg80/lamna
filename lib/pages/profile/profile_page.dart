import 'package:flutter/material.dart';
import 'package:lamna/pages/profile/collaboration_page.dart';
import 'package:lamna/pages/profile/details_application_page.dart';
import 'package:lamna/pages/profile/settings_page.dart';
import 'package:lamna/pages/profile/subscription_page.dart';
import 'package:lamna/pages/stats_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_next_page_new_vision.dart';
import 'package:lamna/utils/widgets/profile/profil_options.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 19.0),
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                minRadius: 60.0,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/avatar/avatar.jpg'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: ColorConstants
                      .greenDarkAppColor), //style for all textspan
              TextSpan(
                children: [
                  TextSpan(
                    text: "Lucas ",
                    style: TextStyle(
                      fontSize: 28,
                      color: ColorConstants.greenDarkAppColor,
                      fontFamily: FontConstants.semiBoldFont,
                    ),
                  ),
                  TextSpan(
                    text: "Guillard",
                    style: TextStyle(
                      fontSize: 28,
                      color: ColorConstants.greenDarkAppColor,
                      fontFamily: FontConstants.regularFont,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Nouveau Membre',
              style: TextStyle(
                  fontFamily: FontConstants.regularFont,
                  fontSize: 14,
                  color: ColorConstants.blackAppColor.withOpacity(.4)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 98,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 24,
                          offset: Offset(0, 8),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '12',
                          style: TextStyle(
                            color: ColorConstants.yellowPrimaryAppColor,
                            fontFamily: FontConstants.boldFont,
                            fontSize: 24,
                          ),
                        ),
                        const Text(
                          textAlign: TextAlign.center,
                          "Commerçants remerciés",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 98,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 24,
                          offset: Offset(0, 8),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            color: ColorConstants.yellowPrimaryAppColor,
                            fontFamily: FontConstants.boldFont,
                            fontSize: 24,
                          ),
                        ),
                        const Text(
                          textAlign: TextAlign.center,
                          "Trajets effectués",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ButtonNextPageNewVison(
              context: context,
              page: const StatsPage(),
              title: 'Toutes les stats.',
              color: ColorConstants.greenLightAppColor,
              icon: Icons.east,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * .9,
              child: const ProfileOptions(
                assetSVG: 'assets/icons/users-01.svg',
                text: 'Abonnements',
                arrow: 'assets/icons/right.svg',
                page: SubscriptionPage(),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * .9,
              child: const ProfileOptions(
                assetSVG: 'assets/icons/clock-refresh.svg',
                text: 'Parrainage',
                arrow: 'assets/icons/right.svg',
                page: CollaborationPage(),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * .9,
              child: const ProfileOptions(
                assetSVG: 'assets/icons/settings-01.svg',
                text: 'Réglages',
                arrow: 'assets/icons/right.svg',
                page: SettingsPage(),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * .9,
              child: const ProfileOptions(
                assetSVG: 'assets/icons/info-circle.svg',
                text: 'Détails de l\'application',
                arrow: 'assets/icons/right.svg',
                page: DetailsApplicationPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
