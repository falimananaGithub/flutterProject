import 'package:app/src/components/common/loading/loading.dart';
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
    //create a pre-loading page
    Future<void> _loadData() async {
      await Future.delayed(Duration(seconds: 1));
    }

    return Scaffold(
        body: Loading(
            future: _loadData(),
            widget: LoginScreen(
                onLocaleChange: widget.onLocaleChange,
                isLangDisponible: widget.isLangDisponible)));
  }
}
