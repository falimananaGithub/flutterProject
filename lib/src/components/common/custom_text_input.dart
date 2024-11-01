import 'package:flutter/material.dart';
import 'package:app/src/core/constants/constant.dart';

class CustomTextInput extends StatefulWidget {
  final TextEditingController inputControler;
  final String hintText;
  final String validatorText;
  const CustomTextInput(
      {super.key,
      required this.inputControler,
      required this.hintText,
      required this.validatorText});

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.inputControler,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                gapPadding: 1,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 236, 233, 233))),
            labelStyle: TextStyle(
                fontFamily: TimesNewRoman, fontSize: 15, color: white),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: hintTextInputColor,
              fontFamily: TimesNewRoman,
            ),
            //contentPadding: EdgeInsets.only(left: 10),
            //constraints: BoxConstraints(maxHeight: 10),
            filled: true,
            fillColor: Colors.white30,
            border: const OutlineInputBorder(
                gapPadding: 1,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 236, 233, 233))),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 228, 227, 227)))));
  }
}
