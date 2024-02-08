import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/button_next_page_new_vision.dart';

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
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white70,
              minRadius: 60.0,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/avatar/avatar.jpg'),
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
              page: '',
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
              child: ProfileOptions(
                assetSVG: 'assets/icons/users-01.svg',
                text: 'Parrainage',
                arrow: 'assets/icons/right.svg',
                onPressed: () {
                  return;
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * .9,
              child: ProfileOptions(
                assetSVG: 'assets/icons/clock-refresh.svg',
                text: 'Historique',
                arrow: 'assets/icons/right.svg',
                onPressed: () {
                  return;
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * .9,
              child: ProfileOptions(
                assetSVG: 'assets/icons/settings-01.svg',
                text: 'Réglages',
                arrow: 'assets/icons/right.svg',
                onPressed: () {
                  return;
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * .9,
              child: ProfileOptions(
                assetSVG: 'assets/icons/info-circle.svg',
                text: 'Détails de l\'application',
                arrow: 'assets/icons/right.svg',
                onPressed: () {
                  return;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOptions extends StatefulWidget {
  final String assetSVG;
  final String text;
  final String arrow;
  final GestureTapCallback onPressed;

  const ProfileOptions({
    super.key,
    required this.assetSVG,
    required this.text,
    required this.arrow,
    required this.onPressed,
  });

  @override
  State<ProfileOptions> createState() => _ProfileOptionsState();
}

class _ProfileOptionsState extends State<ProfileOptions> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                widget.assetSVG,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: FontConstants.mediumFont,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onPressed;
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
          ),
          child: SvgPicture.asset(
            widget.arrow,
            width: 8,
          ),
        )
      ],
    );
  }
}
