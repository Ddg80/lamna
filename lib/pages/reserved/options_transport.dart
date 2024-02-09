import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class OptionsTransportPage extends StatefulWidget {
  const OptionsTransportPage({super.key});

  @override
  State<OptionsTransportPage> createState() => _OptionsTransportPageState();
}

class _OptionsTransportPageState extends State<OptionsTransportPage> {
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
      body: const Text('Options transport page'),
    );
  }
}
