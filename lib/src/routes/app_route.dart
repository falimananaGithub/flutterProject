import 'package:app/src/components/common/transition_page.dart';
import 'package:flutter/material.dart';
//import '../../screens/home_screen.dart';
import 'package:app/src/screens/screen_pre_loading.dart';
import 'package:app/src/screens/screen_register.dart';

class AppRoutes {
  // Définition des noms des routes comme constantes
  //static const String home = '/home';

  AppRoutes({required this.isLangDisponible, required this.onLocaleChange});
  late final Function(Locale) onLocaleChange;
  final bool isLangDisponible;
  final String preloading = '/preloading';
  final String register = '/register';

  // Map des routes pour faciliter la navigation
  Map<String, WidgetBuilder> getRoutes() {
    return {
      //home: (context) => HomeScreen(),
      preloading: (context) => LoadingPage(
          onLocaleChange: onLocaleChange, isLangDisponible: isLangDisponible),
      register: (context) => const RegisterScreen(),
    };
  }

  Route<dynamic>? Function(RouteSettings settings) generateRoute() {
    return (RouteSettings settings) {
      if (settings.name == '/register') {
        return _createRoute(const RegisterScreen(), Direction.leftToRight);
      }
      return null;
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
