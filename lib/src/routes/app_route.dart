import 'package:app/src/screens/screen_home.dart';
import 'package:app/src/screens/screen_login.dart';
import 'package:flutter/material.dart';

import 'package:app/src/screens/screen_register.dart';

class AppRoutes {
  // Définition des noms des routes comme constantes
  //static const String home = '/home';

  AppRoutes({required this.isLangDisponible, required this.onLocaleChange});
  late final Function(Locale) onLocaleChange;
  final bool isLangDisponible;
  final String login = '/login';
  final String register = '/register';
  final String home = '/home';

  // Map des routes pour faciliter la navigation
  Map<String, WidgetBuilder> getRoutes() {
    return {
      //home: (context) => HomeScreen(),
      login: (context) => LoginScreen(
          onLocaleChange: onLocaleChange, isLangDisponible: isLangDisponible),
      register: (context) => const RegisterScreen(),
    };
  }

  Route<dynamic>? Function(RouteSettings settings) generateRoute() {
    return (RouteSettings settings) {
      switch (settings.name) {
        case '/register':
          return _createRoute(const RegisterScreen(), Direction.leftToRight);

        case '/home':
          return _createRoute(HomeScreen(), Direction.leftToRight);
        default:
          return _createRoute(
              LoginScreen(
                  onLocaleChange: onLocaleChange,
                  isLangDisponible: isLangDisponible),
              Direction.leftToRight);
      }
    };
  }
}

enum Direction { leftToRight, rightToLeft }

Route _createRoute(Widget page, Direction direction) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const beginLeft = Offset(-1.0, 0.0); // Slide from left
      const beginRight = Offset(1.0, 0.0); // Slide from right
      const end = Offset.zero;
      const curve = Curves.ease;

      var begin = direction == Direction.leftToRight ? beginLeft : beginRight;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
