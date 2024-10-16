import 'package:app/src/core/constants/constant.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  //final bool isHasLangage;
  final String titleLogo;
  const LogoApp(
      {super.key, /*required this.isHasLangage*/ required this.titleLogo});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 120,
          height: 120,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(233, 237, 238, 0.6),
                Color.fromRGBO(104, 203, 216, 0.6),
                Color.fromRGBO(233, 237, 238, 0.6),
              ]),
              borderRadius: BorderRadius.circular(100)),
          child: Image.asset(
            "assets/images/image.png",
          ),
        ),
        Positioned(
            child: Container(
          padding: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
          child: Center(
            child: ClipPath(
              clipper: ValleyClipper(),
              child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    //color: const Color.fromRGBO(238, 238, 238, 1),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(233, 237, 238, 0.6),
                      Color.fromRGBO(104, 203, 216, 0.6),
                      Color.fromRGBO(233, 237, 238, 0.6),
                    ]),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(20)), // Coins arrondis
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 219, 218, 218)
                            .withOpacity(0.2), // Ombre légère
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: Offset(0, 10), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 0, top: 150, right: 0, bottom: 0),
                    child: Center(
                      child: Text(
                        widget.titleLogo
                        /*widget.isHasLangage
                            ? AppLocalizations.of(context)!.textLogoLogin
                            : AppLocalizations.of(context)!
                                .textLogoLangage*/ /*textLogoLangage*/,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 80, 61, 30),
                            fontFamily: TimesNewRoman,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  )),
            ),
          ),
        ))
      ],
    );
  }
}

class ValleyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double notchRadius = 150.0; // Taille de l'encoche circulaire
    final double centerX = size.width / 2;

    Path path = Path()
      ..moveTo(0, 0) // Commence en haut à gauche
      ..lineTo(centerX - notchRadius, 0) // Avance jusqu'à l'encoche
      ..arcToPoint(
        Offset(centerX + notchRadius, 0),
        radius: Radius.circular(notchRadius),
        clockwise: false,
      ) // Crée l'encoche circulaire
      ..lineTo(size.width, 0) // Continue jusqu'à droite
      ..lineTo(size.width, size.height) // Descend à droite en bas
      ..lineTo(0, size.height) // Ligne jusqu'à gauche en bas
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Pas besoin de reclipper à chaque fois
  }
}
