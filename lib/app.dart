import 'package:app/src/components/common/loading/loading.dart';
import 'package:app/src/core/constants/constant.dart';
import 'package:app/src/features/langage/langage_app.dart';
import 'package:flutter/material.dart';
import 'package:app/src/routes/app_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //default langage
  Locale _defaultLocale = Locale('en', 'English');

  //get instance cacheManager

  bool isHasLangage = false;
  bool isLoading = true;

  void _changeLanguage(Locale locale) {
    print(locale);
    setState(() {
      _defaultLocale = locale;
    });
  }

  Future<void> init() async {
    AppLangage lang = AppLangage();

    bool isHasLangage1 = await lang.isLangTrue();
    Map? langUse = await lang.getLangByIsUse(1);

    _defaultLocale = isHasLangage1
        ? Locale(langUse?['langCode'], langUse?['langCountry'])
        : _defaultLocale;

    setState(() {
      isHasLangage = isHasLangage1;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    init();

    var instance = FirebaseAuth.instance;
    instance.authStateChanges().listen((User? user) {
      print(user);
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AppRoutes routes = AppRoutes(
        onLocaleChange: _changeLanguage, isLangDisponible: isHasLangage);
    return MaterialApp(
        //set langage if it has else set defaults
        locale: _defaultLocale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: Loading(
            widget: Navigator(
                initialRoute: FirebaseAuth.instance.currentUser != null
                    ? routes.login
                    : routes.home,
                onGenerateRoute: routes.generateRoute()),
            color: white,
            size: 100,
            condition: isLoading));
  }
}
