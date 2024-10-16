import 'package:flutter/material.dart';
import 'package:app/src/components/common/logo/logo_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app/src/components/register/form_register.dart';
import 'package:app/src/components/login/form_login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isWantSignIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              LogoApp(
                titleLogo: isWantSignIn
                    ? AppLocalizations.of(context)!.textLogoLogin
                    : AppLocalizations.of(context)!.textSignUp,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                isWantSignIn
                    ? AppLocalizations.of(context)!.textTitleLogin
                    : AppLocalizations.of(context)!.textTitleRegister,
                style: const TextStyle(
                    color: Color.fromARGB(255, 80, 61, 30),
                    fontFamily: 'TimesNewRoman',
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              isWantSignIn
                  ? FormLogin()
                  : FormRegister(onSignInSelected: () {
                      setState(() {
                        isWantSignIn = true; // Change the state
                      });
                    })
            ],
          )
        ],
      ),
    );
  }
}
