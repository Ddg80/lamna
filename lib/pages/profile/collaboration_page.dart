import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/profile/title_collaboration.dart';

class CollaborationPage extends StatefulWidget {
  const CollaborationPage({super.key});

  @override
  State<CollaborationPage> createState() => _CollaborationPageState();
}

class _CollaborationPageState extends State<CollaborationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleCollaboration(context),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Text(
                  "Invitez vos proches à s’inscrire avec votre lien de parrainage, et débloquez davantage de réductions auprès de commerçants locaux lors de vos prochaines voyages.",
                  style: TextStyle(
                    color: ColorConstants.blackAppColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset(
                'assets/collaboration/parrainage-frise.png',
                width: MediaQuery.of(context).size.width * .9,
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -35, 0),
              child: Center(
                child: Image.asset(
                  'assets/collaboration/parrainage-img.png',
                  width: MediaQuery.of(context).size.width * .95,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
