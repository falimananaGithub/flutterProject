import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app/src/core/constants/constant.dart';
import 'package:app/src/components/register/Custom_field_pasword.dart';
import 'package:app/src/components/register/Custom_field_email.dart';
import 'package:app/src/components/register/Custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FormRegister extends StatefulWidget {
  final Function onSignInSelected;
  final bool isWantSignIn;
  const FormRegister(
      {super.key, required this.onSignInSelected, required this.isWantSignIn});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

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
          color: secondFond,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Text(
              widget.isWantSignIn
                  ? AppLocalizations.of(context)!.textTitleLogin
                  : AppLocalizations.of(context)!.textTitleRegister,
              style: TextStyle(
                  color: Colors.grey[200],
                  fontFamily: 'TimesNewRoman',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: GlobalKey<FormState>(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFieldEmail(
                    hintText: AppLocalizations.of(context)!.textHintMail,
                    inputControler: email,
                    validatorText:
                        AppLocalizations.of(context)!.textValidatorEmail,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFieldPassword(
                    hintTextInput:
                        AppLocalizations.of(context)!.textLabelPassword,
                    inputControler: password,
                    setRegex: false,
                    textValidatorPassword: "",
                    labelInput:
                        Text(AppLocalizations.of(context)!.textLabelPassword),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFieldPassword(
                    hintTextInput:
                        AppLocalizations.of(context)!.textConfirmPassword,
                    inputControler: confirmPassword,
                    setRegex: false,
                    textValidatorPassword: "",
                    labelInput:
                        Text(AppLocalizations.of(context)!.textConfirmPassword),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    isIcon: false,
                    onPressed: () {
                      //createUser(context, email, password);
                    },
                    firstText: AppLocalizations.of(context)!.textSignUp,
                    secondText: "",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(
                        height: 1,
                      ),
                      Text(
                        AppLocalizations.of(context)!.textLoginWithGoogle,
                        style: TextStyle(
                          fontFamily: TimesNewRoman,
                          color: white,
                        ),
                      ),
                      Divider(
                        height: 1,
                      )
                    ],
                  ),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 5,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.email,
                              color: white,
                            ))
                      ],
                    ),
                  ),
                  Center(
                      child: MaterialButton(
                    onPressed: () {
                      widget.onSignInSelected();
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.textHaveAccount,
                              style: TextStyle(
                                  fontFamily: TimesNewRoman, color: white)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.textConnexion,
                            style: TextStyle(
                                color: Colors.blue, fontFamily: TimesNewRoman),
                          )
                        ]),
                  ))
                ],
              ),
            )
          ],
        ));
  }
}
