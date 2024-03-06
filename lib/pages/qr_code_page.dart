import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_back_widget.dart';
import 'package:widget_zoom/widget_zoom.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ButtonBackWidget(),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: Center(
        child: WidgetZoom(
          heroAnimationTag: 'tag',
          zoomWidget: Image.asset(
            'assets/QrCode/QR_Code.png',
            width: MediaQuery.of(context).size.width * .8,
          ),
        ),
      ),
    );
  }
}
