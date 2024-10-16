const String dbPath = './src/data/sqflite/';
const int dbVersion = 5;
const String dbName = 'mydb.db';

const tableNameLange = "langages";
const List<String> columnLange = [
  'id INTEGER PRIMARY KEY AUTOINCREMENT',
  'langCode TEXT NOT NULL',
  'langCountry TEXT NOT NULL',
  'isUse INTEGER DEFAULT 0'
];
