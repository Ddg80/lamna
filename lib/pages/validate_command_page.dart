import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class ValidateCommandPage extends StatefulWidget {
  const ValidateCommandPage({super.key});

  @override
  State<ValidateCommandPage> createState() => _ValidateCommandPageState();
}

class _ValidateCommandPageState extends State<ValidateCommandPage> {
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
      body: const Text('Validate Command page'),
    );
  }
}
