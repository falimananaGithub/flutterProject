import 'package:app/src/components/common/loading/Custom_loading.dart';
import 'package:app/src/features/langage/langage_app.dart';
import 'package:app/src/models/langue.dart';
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
  AppLangage langage = AppLangage();

  List<Locale> _locales = [];
  bool _loading = true;
  Locale _selectedLocale = Locale('en', 'English');
  _FormLangageState() {
    setLange();
  }

  void changeLangAfterSelected(BuildContext context, Locale? newValue) async {
    //get langage current use
    Map<dynamic, dynamic>? code = await langage
        .getLangByCode(Localizations.localeOf(context).languageCode);

    //update langage current to isUse 0;
    await langage.updateLang(code!['id'],
        Langue(code['id'], code['langCode'], code['langCountry'], 0));

    Map<dynamic, dynamic>? newValueLange =
        await langage.getLangByCode(newValue!.languageCode);
    await langage.updateLang(
        newValueLange!['id'],
        Langue(newValueLange['id'], newValueLange['langCode'],
            newValueLange['langCountry'], 1));
  }

  void setLange() async {
    List<Map> list = await langage.getLangages();
    print('list lang: ');
    print(list);
    if (list.isEmpty) {
      //create language if not exists
      await langage.saveLang(Langue(1, 'en', 'English', 0));
      await langage.saveLang(Langue(2, 'es', 'Espagnol', 0));
      await langage.saveLang(Langue(3, 'fr', 'Français', 0));
      //await langage.saveLang(Langue(4, 'mg', 'Malagasy', 0));
      list = await langage.getLangages();
    }

    setState(() {
      list.forEach((map) {
        _locales.add(Locale(map['langCode'], map['langCountry']));
      });
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Container(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: CustomLoading.progressiveDots(white, 50),
        ),
      );
    }
    Locale currentLocale = Localizations.localeOf(context);

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
                  color: secondFond, // font button color
                  borderRadius: BorderRadius.circular(15), // border radius
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Locale>(
                    isExpanded: true,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    icon: Icon(Icons.arrow_drop_down, color: white),
                    dropdownColor: inputTextColor,
                    style: const TextStyle(
                        color: white, fontSize: 16, fontFamily: TimesNewRoman),
                    items: _locales.map((Locale locale) {
                      return DropdownMenuItem<Locale>(
                        value: locale,
                        child: Center(child: Text(locale.countryCode!)),
                      );
                    }).toList(),
                    onChanged: (Locale? newValue) {
                      setState(() {
                        _selectedLocale = newValue!;

                        changeLangAfterSelected(context, newValue);

                        widget.onLocaleChange(_selectedLocale);
                      });
                    },
                    value: Locale(currentLocale.languageCode,
                        dataLocale[currentLocale.languageCode]),
                  ),
                ),
              ),
            )),
        const SizedBox(
          height: 30,
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
