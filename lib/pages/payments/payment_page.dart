import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter/services.dart';
import 'package:lamna/models/mastercard.dart';
import 'package:lamna/pages/payments/validate_command_page.dart';
import 'package:lamna/pages/reserved/options_transport.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<StatefulWidget> createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  bool isLightTheme = true;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorConstants.greyAppColor.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final provider = Provider.of<GlobalProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      isLightTheme ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    );
    return MaterialApp(
      title: 'Card de crédits',
      debugShowCheckedModeBanner: false,
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
        textTheme: const TextTheme(
          // Text style for text fields' input.
          titleMedium: TextStyle(color: Colors.black, fontSize: 18),
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: ColorConstants.whiteAppColor,
          background: ColorConstants.blackAppColor,
          // Defines colors like cursor color of the text fields.
          primary: Colors.black,
        ),
        // Decoration theme for the text fields.
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: ColorConstants.blackAppColor,
            fontFamily: FontConstants.regularFont,
          ),
          labelStyle: TextStyle(
            color: ColorConstants.blackAppColor,
            fontFamily: FontConstants.regularFont,
          ),
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: TextTheme(
          // Text style for text fields' input.
          titleMedium:
              TextStyle(color: ColorConstants.whiteAppColor, fontSize: 18),
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: ColorConstants.blackAppColor,
          background: ColorConstants.whiteAppColor,
          // Defines colors like cursor color of the text fields.
          primary: Colors.white,
        ),
        // Decoration theme for the text fields.
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: ColorConstants.whiteAppColor),
          labelStyle: TextStyle(color: ColorConstants.whiteAppColor),
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.greenBlurSecondaryColor.withOpacity(.5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: ColorConstants.greenDarkAppColor,
                ),
              ),
            ),
            onPressed: () => Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const OptionsTransportPage(),
              ),
            ),
          ),
          title: Text.rich(
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstants.greenDarkAppColor,
            ),
            TextSpan(
              children: [
                TextSpan(
                  text: "Paiement",
                  style: TextStyle(
                    fontSize: 23,
                    color: ColorConstants.greenDarkAppColor,
                    fontFamily: FontConstants.semiBoldFont,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: " des billets",
                  style: TextStyle(
                    fontSize: 21,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(
                    isLightTheme
                        ? 'assets/mastercard/bgLight.png'
                        : 'assets/mastercard/bgDark.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Finalisez votre réservation en procédant au paiement sécurisé des billets.',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontConstants.regularFont,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  const Text(
                                    'Total :',
                                    style: TextStyle(
                                      color: Color(0xFF5A5A5A),
                                      fontSize: 27,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0.05,
                                    ),
                                  ),
                                  Text(
                                    ' ${provider.getTotalReservation().toString()} €',
                                    style: const TextStyle(
                                      color: Color(0xFF68B382),
                                      fontSize: 27,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0.03,
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  const Opacity(
                                    opacity: 0.75,
                                    child: Text(
                                      'Commission lämna :',
                                      style: TextStyle(
                                        color: Color(0xFF5A5A5A),
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0.08,
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.75,
                                    child: Text(
                                      ' ${provider.getCommissionReservation().toString()} € (5%)',
                                      style: const TextStyle(
                                        color: Color(0xFF68B382),
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0.07,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                      IconButton(
                        onPressed: () => setState(() {
                          isLightTheme = !isLightTheme;
                        }),
                        icon: Icon(
                          isLightTheme ? Icons.light_mode : Icons.dark_mode,
                        ),
                      ),
                      CreditCardWidget(
                        enableFloatingCard: useFloatingAnimation,
                        glassmorphismConfig: _getGlassmorphismConfig(),
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        bankName: 'Axis Bank',
                        frontCardBorder: useGlassMorphism
                            ? null
                            : Border.all(color: Colors.grey),
                        backCardBorder: useGlassMorphism
                            ? null
                            : Border.all(color: Colors.grey),
                        showBackView: isCvvFocused,
                        obscureCardNumber: true,
                        obscureCardCvv: true,
                        isHolderNameVisible: true,
                        cardBgColor: isLightTheme
                            ? ColorConstants.cardBgLightColor
                            : ColorConstants.cardBgColor,
                        backgroundImage: useBackgroundImage
                            ? 'assets/mastercard/cardBg.png'
                            : null,
                        isSwipeGestureEnabled: true,
                        onCreditCardWidgetChange:
                            (CreditCardBrand creditCardBrand) {},
                        customCardTypeIcons: <CustomCardTypeIcon>[
                          CustomCardTypeIcon(
                            cardType: CardType.mastercard,
                            cardImage: Image.asset(
                              'assets/mastercard/mastercard.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ],
                      ),
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        inputConfiguration: const InputConfiguration(
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Numéro',
                            hintText: 'XXXX XXXX XXXX XXXX',
                          ),
                          expiryDateDecoration: InputDecoration(
                            labelText: 'MM / YY',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            labelText: 'Nom Prénom',
                          ),
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          height: 60,
          child: GestureDetector(
            onTap: _onValidate,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.greenLightAppColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Valider le paiement',
                    style: TextStyle(
                      color: ColorConstants.whiteAppColor,
                      fontFamily: FontConstants.regularFont,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.east,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      MasterCard card = MasterCard(
        id: 1,
        numberCard: cardNumber,
        expiredDate: expiryDate,
        cvv: cvvCode,
        fullname: cardHolderName,
      );
      provider.setMasterCard(card);
      provider.setHaveATravel(true);
      provider.setDays();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ValidateCommandPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Une Erreur est survenue lors du paiement.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Glassmorphism? _getGlassmorphismConfig() {
    if (!useGlassMorphism) {
      return null;
    }

    final LinearGradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
      stops: const <double>[0.3, 0],
    );

    return isLightTheme
        ? Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient)
        : Glassmorphism.defaultConfig();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
