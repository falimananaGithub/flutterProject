import 'package:app/src/core/constants/constant.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  //final bool isHasLangage;;
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height * 0.20,
      //color: primaryFond,
      children: [
        Container(
          width: 120,
          height: 120,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(100)),
          child: Image.asset(
            "assets/images/image.png",
          ),
        )
      ],
    );
  }
}
