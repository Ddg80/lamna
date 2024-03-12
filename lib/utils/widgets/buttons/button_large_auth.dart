import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lamna/models/accounts.dart';
import 'package:lamna/pages/home_page.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/widgets/taosts/error_toast.dart';
import 'package:lamna/utils/widgets/taosts/info_toast.dart';
import 'dart:developer';

import 'package:provider/provider.dart';

class ButtonLargeAuth extends StatefulWidget {
  const ButtonLargeAuth({
    super.key,
    required this.text,
    required this.color,
    required this.keyForm,
    required this.fontsize,
    required this.textFieldsValue,
  });

  final Map<String, dynamic> textFieldsValue;
  final String text;
  final Color color;
  final dynamic keyForm;
  final double fontsize;

  @override
  State<ButtonLargeAuth> createState() => _ButtonLargeAuthState();
}

class _ButtonLargeAuthState extends State<ButtonLargeAuth> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        if (widget.keyForm.currentState!.validate()) {
          /* only look for email (not password) */
          var accountsFound = accounts.where((account) {
            log('${account.email} | ${widget.textFieldsValue["email"]}');
            return account.email == widget.textFieldsValue['email'];
          });

          if (accountsFound.isNotEmpty) {
            var firstMatchingAccount = accountsFound.first;
            Provider.of<GlobalProvider>(context, listen: false)
                .setAccount(firstMatchingAccount);

            fToast.showToast(
              child: InfoToast(
                  message: "Bon retour ${firstMatchingAccount.firstName} !"),
              gravity: ToastGravity.TOP,
              toastDuration: const Duration(seconds: 2),
            );

            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const HomePage(),
            ));
          } else {
            fToast.showToast(
              child: const ErrorToast(message: "Compte non valide !"),
              gravity: ToastGravity.TOP,
              toastDuration: const Duration(seconds: 2),
            );
          }
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: ColorConstants.blackAppColor,
                  fontSize: widget.fontsize,
                  fontFamily: FontConstants.mediumFont,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Icon(
                Icons.east,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
