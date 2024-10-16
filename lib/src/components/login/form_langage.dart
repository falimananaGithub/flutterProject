import 'package:app/src/data/caches/cache.dart';
import 'package:flutter/material.dart';
import 'package:app/src/core/constants/constant.dart';

class FormLangage extends StatefulWidget {
  final Function onContinueSelected;
  final Function(Locale) onLocaleChange;

  FormLangage(
      {super.key,
      required this.onContinueSelected,
      required this.onLocaleChange});

  @override
  State<FormLangage> createState() => _FormLangageState();
}

class _FormLangageState extends State<FormLangage> {
  final List<Locale> _locales = const [
    Locale('en', 'English'), // English
    Locale('fr', 'Francais'), // French
    Locale('mg', 'Malagasy'), // Malagasy
  ];

  Locale _selectedLocale = Locale('en', 'English');

//save langage in cache
  CacheManager cacheManager = CacheManager.getInstance();
  void setLange(String key, String value) async {
    await cacheManager.saveData(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            alignment: Alignment.center,
            child: Center(
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 10), // padding side
                decoration: BoxDecoration(
                  color:
                      Color.fromRGBO(240, 241, 241, 0.757), // font button color
                  borderRadius: BorderRadius.circular(15), // border radius
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Locale>(
                    isExpanded: true,

                    icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                    dropdownColor:
                        Colors.grey[200], // Couleur du menu déroulant
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: TimesNewRoman),
                    items: _locales.map((Locale locale) {
                      return DropdownMenuItem<Locale>(
                        value: locale,
                        child: Center(child: Text(locale.countryCode!)),
                      );
                    }).toList(),
                    onChanged: (Locale? newValue) {
                      setState(() {
                        _selectedLocale = newValue!;
                        setLange(StringLangCode, newValue.languageCode);
                        setLange(StringLangCountry,
                            newValue.countryCode ?? 'English');
                        widget.onLocaleChange(_selectedLocale);
                      });
                    },
                    value: _selectedLocale,
                  ),
                ),
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 300,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusColor: Color.fromRGBO(240, 241, 241, 0.757),
            onPressed: () {
              widget.onContinueSelected();
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Continue",
                  style:
                      TextStyle(color: Colors.blue, fontFamily: TimesNewRoman),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
