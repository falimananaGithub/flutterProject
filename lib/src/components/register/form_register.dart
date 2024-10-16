import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app/src/core/constants/constant.dart';
import 'package:app/src/components/register/Custom_field_pasword.dart';
import 'package:app/src/components/register/Custom_field_email.dart';
import 'package:app/src/components/register/Custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FormRegister extends StatefulWidget {
  final Function onSignInSelected;
  const FormRegister({super.key, required this.onSignInSelected});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController ConfirmPassword = TextEditingController();

  void createUser(BuildContext context, TextEditingController mail,
      TextEditingController pass) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail.text,
        password: pass.text,
      );
      Navigator.of(context).pushReplacementNamed('/preloading');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
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
          CustomFieldEmail(
            hintText: AppLocalizations.of(context)!.textHintMail,
            inputControler: email,
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
          CustomFieldPassword(
            hintTextInput: AppLocalizations.of(context)!.textLabelPassword,
            inputControler: password,
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
                AppLocalizations.of(context)!.textConfirmPassword,
                style: TextStyle(
                  fontFamily: TimesNewRoman,
                ),
              )
            ],
          ),
          CustomFieldPassword(
            hintTextInput: AppLocalizations.of(context)!.textConfirmPassword,
            inputControler: ConfirmPassword,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            isIcon: false,
            onPressed: () {
              createUser(context, email, password);
            },
            firstText: AppLocalizations.of(context)!.textSignUp,
            secondText: "",
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
            isIcon: true,
            onPressed: () {},
            firstText: AppLocalizations.of(context)!.textLoginWithGoogle,
            secondText: "",
          ),
          Center(
              child: MaterialButton(
            onPressed: () {
              widget.onSignInSelected();
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(AppLocalizations.of(context)!.textHaveAccount,
                  style: TextStyle(fontFamily: TimesNewRoman)),
              SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context)!.textConnexion,
                style: TextStyle(color: Colors.blue, fontFamily: TimesNewRoman),
              )
            ]),
          ))
        ],
      ),
    );
  }
}
