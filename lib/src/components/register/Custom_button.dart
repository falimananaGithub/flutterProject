import 'package:app/src/core/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final bool isIcon;
  final Function onPressed;
  final String firstText;
  final String secondText;
  const CustomButton(
      {super.key,
      required this.isIcon,
      required this.onPressed,
      required this.firstText,
      required this.secondText});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          color: Colors.blue,
          minWidth: 300,
          onPressed: () {
            widget.onPressed();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.firstText,
                style:
                    TextStyle(color: Colors.white, fontFamily: TimesNewRoman),
              ),
              SizedBox(
                width: 10,
              ),
              widget.isIcon ? Icon(Icons.facebook) : Text(widget.secondText)
            ],
          )),
    );
  }
}
