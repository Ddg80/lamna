import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class DetailsApplicationPage extends StatefulWidget {
  const DetailsApplicationPage({super.key});

  @override
  State<DetailsApplicationPage> createState() => _DetailsApplicationPageState();
}

class _DetailsApplicationPageState extends State<DetailsApplicationPage> {
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
      body: const Text('Details application page'),
    );
  }
}
