import 'package:flutter/material.dart';
import 'package:lamna/models/accounts.dart';
import 'package:lamna/pages/historique_qrcodes.dart';
import 'package:lamna/pages/profile/collaboration_page.dart';
import 'package:lamna/pages/profile/details_application_page.dart';
import 'package:lamna/pages/profile/settings_page.dart';
import 'package:lamna/pages/profile/subscription_page.dart';
import 'package:lamna/pages/profile/stats_page.dart';
import 'package:lamna/pages/scan_qr_code.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_next_page_new_vision.dart';
import 'package:lamna/utils/widgets/cards/card_lamna.dart';
import 'package:lamna/utils/widgets/profile/profil_options.dart';
import 'package:provider/provider.dart';

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
                    text: Provider.of<GlobalProvider>(context, listen: true)
                            .account
                            ?.firstName ??
                        "Lucas ",
                    style: TextStyle(
                      fontSize: 28,
                      color: ColorConstants.greenDarkAppColor,
                      fontFamily: FontConstants.semiBoldFont,
                    ),
                  ),
                  TextSpan(
                    text: Provider.of<GlobalProvider>(context, listen: true)
                            .account
                            ?.firstName ??
                        "Guillard",
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
            const Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CardLamna(
                    statistic: 12,
                    title: 'commerçants ',
                    subtitle: ' remerciés!',
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
            if (Provider.of<GlobalProvider>(context).getAccount()!.type ==
                AccountType.traveler)
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * .9,
                child: const ProfileOptions(
                    assetSVG: 'assets/icons/info-circle.svg',
                    text: 'Historique des QR codes',
                    arrow: 'assets/icons/right.svg',
                    page: HistoriqueQrCodes()),
              ),
            if (Provider.of<GlobalProvider>(context).getAccount()!.type ==
                AccountType.traveler)
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * .9,
                child: const ProfileOptions(
                    assetSVG: 'assets/icons/info-circle.svg',
                    text: 'Scanner un QR Code',
                    arrow: 'assets/icons/right.svg',
                    page: ScanQRCodePage()),
              ),
          ],
        ),
      ),
    );
  }
}
