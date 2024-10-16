import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app/src/core/constants/constant.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        boxShadow: const [
          BoxShadow(
            color: const Color.fromARGB(141, 90, 89, 89), // Ombre légère
            blurRadius: 3,
            offset: Offset(0, 1), // Décalage de l'ombre
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.mail,
                color: Color.fromRGBO(135, 206, 235, 1.0),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Email:",
                style: TextStyle(
                  fontFamily: TimesNewRoman,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.textHintMail,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontFamily: TimesNewRoman,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 236, 233, 233))),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 228, 227, 227)))),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(Icons.lock, color: Color.fromRGBO(135, 206, 235, 1.0)),
              SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context)!.textLabelPassword,
                style: TextStyle(
                  fontFamily: TimesNewRoman,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.textLabelPassword,
                  //helperText: "Password invalide! please try again",
                  helperStyle: TextStyle(color: Colors.red),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: TimesNewRoman,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))))),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topRight,
            child: Text(AppLocalizations.of(context)!.textForgotPassword),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              color: const Color.fromRGBO(135, 206, 235, 1.0),
              minWidth: 300,
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.textConnexion,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Center(
            child: Text(AppLocalizations.of(context)!.textLoginWithGoogle),
          ),
          Center(
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.facebook)),
          ),
          Center(
              child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(AppLocalizations.of(context)!.textDontAccount),
              SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context)!.textSignUp,
                style: TextStyle(color: Colors.blue),
              )
            ]),
          ))
        ],
      ),
    );
  }
}
