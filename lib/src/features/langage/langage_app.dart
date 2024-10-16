import 'package:app/src/core/constants/db_config.dart';
import 'package:app/src/data/sqflite/databases.dart';
import 'package:app/src/models/langue.dart';

class AppLangage {
  DataBaseManager _dbMananger =
      DataBaseManager(pathDatabase: dbPath, dbName: dbName, version: dbVersion);

  AppLangage() {
    _createTable();
  }

  void _createTable() async {
    await _dbMananger.createTable(
        tableName: tableNameLange, columns: columnLange);
  }

  Future<List<Map>> getLangages() async {
    return await _dbMananger.list(tableNameLange);
  }

  Future<Map?> getLangByCode(String langCode) async {
    return await _dbMananger
        .getOneByWhere(tableNameLange, columnLange, {"langCode": langCode});
  }

  Future<bool> saveLang(
    Langue lang,
  ) async {
    return await _dbMananger.insert(tableNameLange, columnLange, lang);
  }

  // langage disponible
  Future<bool> isLangTrue() async {
    Map? res = await _dbMananger
        .getOneByWhere(tableNameLange, columnLange, {"isUse": 1});
    return res!.isEmpty ? false : true;
  }

  Future<Map?> getLangByIsUse(int value) async {
    return await _dbMananger
        .getOneByWhere(tableNameLange, columnLange, {"isUse": value});
  }

  Future<bool> updateLang(int id, Langue lang) async {
    return await _dbMananger.update(tableNameLange, columnLange, id, lang);
  }
}
