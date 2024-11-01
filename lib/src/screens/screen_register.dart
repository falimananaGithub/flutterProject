import 'package:app/src/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:app/src/components/common/logo/logo_app.dart';
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
      backgroundColor: primaryFond,
      body: ListView(
        children: [
          Column(
            children: [
              LogoApp(),
              const SizedBox(
                height: 30,
              ),
              isWantSignIn
                  ? FormLogin()
                  : FormRegister(
                      onSignInSelected: () {
                        setState(() {
                          isWantSignIn = true; // Change the state
                        });
                      },
                      isWantSignIn: isWantSignIn,
                    )
            ],
          )
        ],
      ),
    );
  }
}
