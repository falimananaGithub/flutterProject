import 'package:app/src/components/login/form_langage.dart';
import 'package:app/src/core/constants/constant.dart';

import 'package:flutter/material.dart';
import 'package:app/src/components/login/form_login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app/src/components/common/logo/logo_app.dart';

class LoginScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  final bool isLangDisponible;
  const LoginScreen(
      {Key? key, required this.onLocaleChange, required this.isLangDisponible})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    print("d");
    print(widget.isLangDisponible);
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              LogoApp(
                titleLogo: widget.isLangDisponible
                    ? AppLocalizations.of(context)!.textLogoLogin
                    : AppLocalizations.of(context)!.textLogoLangage,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.isLangDisponible
                    ? AppLocalizations.of(context)!.textTitleLogin
                    : AppLocalizations.of(context)!.textTitleLangage,
                style: const TextStyle(
                    color: Color.fromARGB(255, 80, 61, 30),
                    fontFamily: TimesNewRoman,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              //form login
              widget.isLangDisponible
                  ? FormLogin()
                  : FormLangage(
                      onLocaleChange: widget.onLocaleChange,
                      onContinueSelected: () {
                        setState(() {
                          //isLangDisponible = true;
                        });
                      },
                    )
            ],
          ),
        ],
      ),
    );
  }
}
