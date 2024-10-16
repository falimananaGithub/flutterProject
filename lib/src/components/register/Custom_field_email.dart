import 'package:flutter/material.dart';
import 'package:app/src/core/constants/constant.dart';

class CustomFieldEmail extends StatefulWidget {
  final TextEditingController inputControler;
  final String hintText;
  const CustomFieldEmail(
      {super.key, required this.inputControler, required this.hintText});

  @override
  State<CustomFieldEmail> createState() => _CustomFieldEmailState();
}

class _CustomFieldEmailState extends State<CustomFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.inputControler,
      decoration: InputDecoration(
          hintText: widget.hintText,
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
    );
  }
}
