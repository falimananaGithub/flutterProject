import 'package:app/src/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:app/src/screens/screen_login.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage(
      {Key? key, required this.onLocaleChange, required this.isLangDisponible})
      : super(key: key);
  final Function(Locale) onLocaleChange;
  final bool isLangDisponible;
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryFond,
        body: LoginScreen(
            onLocaleChange: widget.onLocaleChange,
            isLangDisponible: widget.isLangDisponible));
  }
}
