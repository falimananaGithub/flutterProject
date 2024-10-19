import 'package:flutter/material.dart';
import 'package:app/src/core/constants/constant.dart';

class CustomFieldPassword extends StatefulWidget {
  final String hintTextInput;
  final TextEditingController inputControler;
  final bool setRegex;
  final String textValidatorPassword;
  final Widget? labelInput;
  const CustomFieldPassword({
    super.key,
    required this.hintTextInput,
    required this.inputControler,
    required this.setRegex,
    required this.textValidatorPassword,
    this.labelInput,
  });

  @override
  State<CustomFieldPassword> createState() => _CustomFieldPasswordState();
}

class _CustomFieldPasswordState extends State<CustomFieldPassword> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !passwordVisible,
      controller: widget.inputControler,
      validator: (value) {
        return validatePassword(value ?? '');
      },
      style: TextStyle(
        color: white,
        fontFamily: TimesNewRoman,
      ),
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: white,
          ),
          hintText: widget.hintTextInput,
          label: widget.labelInput,
          labelStyle:
              TextStyle(color: white, fontFamily: TimesNewRoman, fontSize: 15),
          //helperText: "Password invalide! please try again",
          helperStyle: TextStyle(color: Colors.red),
          hintStyle: TextStyle(
            color: hintTextInputColor,
            fontFamily: TimesNewRoman,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: white,
            ),
            onPressed: () {
              setState(
                () {
                  passwordVisible = !passwordVisible;
                },
              );
            },
          ),
          filled: true,
          fillColor: inputTextColor,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          border: const OutlineInputBorder(
              gapPadding: 1,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 236, 233, 233))),
          focusedBorder: OutlineInputBorder(
              gapPadding: 1,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 236, 233, 233))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 228, 227, 227)))),
    );
  }

  String? validatePassword(String value) {
    // Regex pattern:
    // ^ --> start of the string
    // (?=.*[a-z]) --> at least one lowercase letter
    // (?=.*[A-Z]) --> at least one uppercase letter
    // (?=.*\d) --> at least one digit
    // (?=.*[@$!%*?&]) --> at least one special character from this set
    // .{8,} --> at least 8 characters long
    // $ --> end of the string
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'Please enter a password';
    } else if (!regExp.hasMatch(value)) {
      return 'Password must be at least 8 characters long, include uppercase, lowercase, number, and a special character';
    }
    return null;
  }
}
