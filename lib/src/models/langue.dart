import 'package:app/src/core/constants/db_config.dart';

class Langue {
  int _id;
  String _langCode;
  String _langCountry;
  int _iseUse;
  List<String> columns = columnLange;
  Langue(this._id, this._langCode, this._langCountry, this._iseUse);

//Getter for id
  int get id => _id;

  // Setter for id
  set id(int id) {
    _id = id;
  }

  // Getter for langCode
  String get langCode => _langCode;

  // Setter for langCode
  set langCode(String langCode) {
    _langCode = langCode;
  }

  // Getter for langCountry
  String get langCountry => _langCountry;

  int get isUse => _iseUse;
  set isUse(int isUse) => _iseUse;

  // Setter for langCountry
  set langCountry(String langCountry) => _langCountry;

  Map<String, Object> map() {
    return {
      'id': id,
      'langCode': langCode,
      'langCountry': langCountry,
      'isUse': isUse
    };
  }

  void fromMap(Map<String, dynamic> map) {
    id = map.values.elementAt(0);
    langCode = map.values.elementAt(1);
    langCountry = map.values.elementAt(2);
  }
}
