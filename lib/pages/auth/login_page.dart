import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamna/pages/auth/register_page.dart';
import 'package:lamna/pages/home_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/font_constants.dart';
import 'package:lamna/utils/validator_fields.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';
import 'package:lamna/utils/widgets/buttons/button_large_network.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool enable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 38.0),
              child: SizedBox(
                height: 50,
                child: SvgPicture.asset(
                  'assets/logos/logoLamnaApp.svg',
                  width: 200,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Adresse email",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: FontConstants.semiBoldFont,
                                fontSize: 18,
                                color: ColorConstants.greenDarkAppColor),
                          ),
                        ),
                        SizedBox(
                          height: 51,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'johndoe@gmail.com',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: FontConstants.interRegularFont,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (data) {
                              if (emailController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                enable = false;
                              } else {
                                enable = true;
                              }
                              setState(() {});
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty && !value.isValidEmail) {
                                return 'Merci de renseigner une adresse email valide.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Mot de passe",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: FontConstants.semiBoldFont,
                              fontSize: 18,
                              color: ColorConstants.greenDarkAppColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 51,
                          child: TextFormField(
                            obscureText: _isObscure,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Minimum 8 caractères',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: FontConstants.interRegularFont,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                            ),
                            onChanged: (data) {
                              if (emailController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                enable = false;
                              } else {
                                enable = true;
                              }
                              setState(() {});
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty && !value.isValidPassword) {
                                return 'Merci de renseigner un mot de passe valide';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: ButtonLarge(
                            text: "Se connecter",
                            color: enable
                                ? ColorConstants.greenLightAppColor
                                : Colors.grey,
                            fontsize: 20,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const HomePage(),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor:
                                      ColorConstants.greenLightAppColor,
                                  content: enable
                                      ? const Text('Bienvenue')
                                      : const Text(
                                          'Veuillez remplir les champs'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                          child: Divider(color: ColorConstants.greyAppColor),
                        )),
                        Text("ou",
                            style: TextStyle(
                                color: ColorConstants.greyAppColor,
                                fontSize: 18)),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                            child: Divider(color: ColorConstants.greyAppColor),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ButtonLargeNetwork(
                          text: "Se connecter avec Google",
                          image: 'assets/logos/logo_google.png'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ButtonLargeNetwork(
                          text: "Se connecter avec apple",
                          image: 'assets/logos/logo_mac_os.png'),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  ),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "Compte n'existe pas ?",
                        style: TextStyle(
                          color: ColorConstants.blackAppColor,
                          fontFamily: FontConstants.interLightFont,
                        ),
                      ),
                      TextSpan(
                        text: " S'inscrire ",
                        style: TextStyle(
                          color: ColorConstants.greenLightAppColor,
                          fontSize: 15,
                          fontFamily: FontConstants.interLightFont,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorConstants.greenLightAppColor,
                          decorationThickness: 2,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
