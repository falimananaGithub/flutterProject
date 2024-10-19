import 'package:flutter/material.dart';
import 'package:app/src/core/constants/constant.dart';

class CustomFieldEmail extends StatefulWidget {
  final TextEditingController inputControler;
  final String hintText;
  final String validatorText;
  const CustomFieldEmail(
      {super.key,
      required this.inputControler,
      required this.hintText,
      required this.validatorText});

  @override
  State<CustomFieldEmail> createState() => _CustomFieldEmailState();
}

class _CustomFieldEmailState extends State<CustomFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || !RegExp(r'^[^@]+@[^@]+\[^@]+').hasMatch(value)) {
          return widget.validatorText;
        }
        return null;
      },
      style: TextStyle(color: white, fontFamily: TimesNewRoman, fontSize: 15),
      controller: widget.inputControler,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              gapPadding: 1,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 236, 233, 233))),
          icon: Icon(
            Icons.email,
            color: white,
          ),
          labelStyle:
              TextStyle(fontFamily: TimesNewRoman, fontSize: 15, color: white),
          label: Text(
            "E-mail",
            style: TextStyle(
              fontFamily: TimesNewRoman,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: hintTextInputColor,
            fontFamily: TimesNewRoman,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
          filled: true,
          fillColor: Colors.white30,
          border: const OutlineInputBorder(
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
}
