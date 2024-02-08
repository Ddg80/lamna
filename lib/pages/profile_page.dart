import 'package:flutter/material.dart';
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
      body: Column(
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
                color:
                    ColorConstants.greenDarkAppColor), //style for all textspan
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
        ],
      ),
    );
  }
}
