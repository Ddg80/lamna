import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';

class ProfileOptions extends StatefulWidget {
  final String assetSVG;
  final String text;
  final String arrow;
  final dynamic page;

  const ProfileOptions({
    super.key,
    required this.assetSVG,
    required this.text,
    required this.arrow,
    required this.page,
  });

  @override
  State<ProfileOptions> createState() => _ProfileOptionsState();
}

class _ProfileOptionsState extends State<ProfileOptions> {
  void _navigate(context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

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
            _navigate(context, widget.page);
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
