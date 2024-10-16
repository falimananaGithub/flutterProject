import 'package:flutter/material.dart';
import 'package:app/src/core/constants/constant.dart';

class CustomFieldPassword extends StatefulWidget {
  final String hintTextInput;
  final TextEditingController inputControler;
  const CustomFieldPassword({
    super.key,
    required this.hintTextInput,
    required this.inputControler,
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
        decoration: InputDecoration(
            hintText: widget.hintTextInput,
            //helperText: "Password invalide! please try again",
            helperStyle: TextStyle(color: Colors.red),
            hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: TimesNewRoman,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off),
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
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))));
  }
}
