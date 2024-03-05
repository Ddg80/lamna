import 'package:flutter/material.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/profile/title_collaboration.dart';
import 'package:provider/provider.dart';

class CollaborationPage extends StatefulWidget {
  const CollaborationPage({super.key});

  @override
  State<CollaborationPage> createState() => _CollaborationPageState();
}

class _CollaborationPageState extends State<CollaborationPage> {
  late final provider = Provider.of<GlobalProvider>(context, listen: true);
  String link = 'https://lamna.app/invite:4EKFL56';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String copyLink = provider.getLinkCollaboration();
    return Scaffold(
        appBar: AppBar(
          title: titleCollaboration(context),
          backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
          elevation: 0,
          toolbarHeight: 80,
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: Text(
                  "Invitez vos proches à s’inscrire avec votre lien de parrainage, et débloquez davantage de réductions auprès de commerçants locaux lors de vos prochaines voyages.",
                  style: TextStyle(
                    color: ColorConstants.blackAppColor,
                    fontFamily: FontConstants.interRegularFont,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0, top: 42),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                height: 200,
                child: Image.asset(
                  'assets/collaboration/parrainage-frise.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                "assets/collaboration/parrainage-img.png",
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomLeft,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 300.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .85,
                  height: MediaQuery.of(context).size.height * .25,
                  decoration: ShapeDecoration(
                    color: ColorConstants.whiteAppColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: [
                      BoxShadow(
                        color: ColorConstants.whiteAppColor,
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, top: 5.0),
                            child: Text(
                              'Lien à partager',
                              style: TextStyle(
                                color: ColorConstants.greenDarkAppColor,
                                fontSize: 16,
                                fontFamily: FontConstants.principalFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              height: 70,
                              decoration: ShapeDecoration(
                                color: ColorConstants.whiteAppColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: ColorConstants.greyAppColor,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        link,
                                        style: TextStyle(
                                          color: ColorConstants.blackAppColor,
                                          fontSize: 12,
                                          fontFamily:
                                              FontConstants.principalFont,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: GestureDetector(
                                        child: copyLink.isNotEmpty
                                            ? Icon(Icons.check,
                                                color: ColorConstants
                                                    .greenDarkAppColor,
                                                size: 22)
                                            : Icon(Icons.copy,
                                                color: ColorConstants
                                                    .greenDarkAppColor,
                                                size: 22),
                                        onTap: () {
                                          provider.setLinkCollaboration(link);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor: ColorConstants
                                                  .greenLightAppColor,
                                              content: copyLink.isNotEmpty
                                                  ? const Text("Déjà copier!")
                                                  : const Text("Copier!"),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .8,
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '6 ',
                                  style: TextStyle(
                                    color: ColorConstants.greenDarkAppColor,
                                    fontSize: 16,
                                    fontFamily: FontConstants.interMediumFont,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  'personnes, on rejoint Lämna grâce à toi',
                                  style: TextStyle(
                                    color: ColorConstants.blackAppColor,
                                    fontSize: 13,
                                    fontFamily: FontConstants.interRegularFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
