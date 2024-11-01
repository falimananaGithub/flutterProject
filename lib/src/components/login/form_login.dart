import 'package:app/src/components/register/Custom_button.dart';
import 'package:app/src/components/register/Custom_field_email.dart';
import 'package:app/src/components/register/Custom_field_pasword.dart';
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
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  void login(
      TextEditingController emailEdit, TextEditingController passwordEdit) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
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
              AppLocalizations.of(context)!.textLogoLogin,
              style: TextStyle(
                  color: white,
                  fontFamily: 'TimesNewRoman',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
                key: GlobalKey<FormState>(),
                child: Column(
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
                      height: 10,
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
                      height: 10,
                    ),
                    CustomButton(
                      isIcon: false,
                      onPressed: () {
                        login(email, password);
                      },
                      firstText: AppLocalizations.of(context)!.textConnexion,
                      secondText: "",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        AppLocalizations.of(context)!.textForgotPassword,
                        style:
                            TextStyle(color: white, fontFamily: TimesNewRoman),
                      ),
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
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!.textDontAccount,
                                style: TextStyle(
                                    fontFamily: TimesNewRoman, color: white)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLocalizations.of(context)!.textSignUp,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: TimesNewRoman),
                            )
                          ]),
                    ))
                  ],
                ))
          ],
        ));
  }
}

/*
Column(
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

*/
