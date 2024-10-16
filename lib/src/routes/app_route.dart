import 'package:flutter/material.dart';
//import '../../screens/home_screen.dart';
import 'package:app/src/screens/screen_pre_loading.dart';
import 'package:app/src/screens/screen_register.dart';

class AppRoutes {
  // Définition des noms des routes comme constantes
  //static const String home = '/home';
  late final Function(Locale) onLocaleChange;
  final bool isLangDisponible;
  final String preloading = '/preloading';
  final String register = '/register';
  AppRoutes({required this.isLangDisponible, required this.onLocaleChange});

  // Map des routes pour faciliter la navigation
  Map<String, WidgetBuilder> getRoutes() {
    return {
      //home: (context) => HomeScreen(),
      preloading: (context) => LoadingPage(
          onLocaleChange: onLocaleChange, isLangDisponible: isLangDisponible),
      register: (context) => const RegisterScreen(),
    };
  }
}
