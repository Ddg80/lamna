import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class HeaderDetailsDestination extends StatelessWidget {
  const HeaderDetailsDestination({
    Key? key,
    required this.detailPicture,
    required this.label,
  }) : super(key: key);

  final String detailPicture;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          detailPicture,
          height: 150,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0, left: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width * .45,
            decoration: ShapeDecoration(
              color: ColorConstants.yellowPrimaryAppColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_active_outlined,
                    color: ColorConstants.whiteAppColor,
                    size: 12,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                        color: ColorConstants.whiteAppColor, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
