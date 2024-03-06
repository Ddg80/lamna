import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_back_widget.dart';
import 'package:provider/provider.dart';

class DetailsApplicationPage extends StatefulWidget {
  const DetailsApplicationPage({super.key});

  @override
  State<DetailsApplicationPage> createState() => _DetailsApplicationPageState();
}

class _DetailsApplicationPageState extends State<DetailsApplicationPage> {
  late final provider = Provider.of<GlobalProvider>(context, listen: false);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String date = provider.getCurrentDate(context);
    return Scaffold(
      appBar: AppBar(
        leading: const ButtonBackWidget(),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logos/darkIconTypo.svg',
              width: 200,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text('Version 1.0.0 : Lämna | $date'),
          ],
        ),
      ),
    );
  }
}
