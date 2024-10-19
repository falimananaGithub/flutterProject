import 'package:app/src/components/login/form_langage.dart';
import 'package:app/src/core/constants/constant.dart';

import 'package:flutter/material.dart';
import 'package:app/src/components/login/form_login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app/src/components/common/logo/logo_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {Key? key, required this.onLocaleChange, required this.isLangDisponible})
      : super(key: key);
  final Function(Locale) onLocaleChange;
  final bool isLangDisponible;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isContinue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryFond,
      body: ListView(
        children: [
          Column(
            children: [
              LogoApp(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              widget.isLangDisponible == false
                  ? Text(
                      AppLocalizations.of(context)!.textTitleLangage,
                      style: const TextStyle(
                          color: white,
                          fontFamily: TimesNewRoman,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(""),
              const SizedBox(
                height: 10,
              ),
              //form login
              widget.isLangDisponible || _isContinue
                  ? FormLogin()
                  : FormLangage(
                      onLocaleChange: widget.onLocaleChange,
                      onContinueSelected: () {
                        setState(() {
                          _isContinue = true;
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
