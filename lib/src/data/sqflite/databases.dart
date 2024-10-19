import 'package:sqflite/sqflite.dart';

class DataBaseManager {
  final String pathDatabase;
  final String dbName;
  final int version;

  Database? _database; // Private variable to hold the database instance

  DataBaseManager({
    required this.pathDatabase,
    required this.dbName,
    required this.version,
  });

  // Open the database only if it's not already open
  Future<Database> open() async {
    if (_database != null)
      return _database!; // Return existing instance if available

    _database = await openDatabase(pathDatabase + dbName, version: version,
        onCreate: (Database db, int version) async {
      print("Database created");
      //
    });
    return _database!; // Return the newly opened instance
  }

  // Set the table name and columns for the database
  Future<bool> createTable({
    required String tableName,
    required List<String> columns,
  }) async {
    // Start the SQL query for creating the table
    String sql = "CREATE TABLE IF NOT EXISTS $tableName (";

    // Iterate through the columns
    columns.forEach((e) {
      sql += "$e,";
    });

    // Remove the last comma and close the parentheses
    sql = sql.substring(0, sql.length - 1) + ")";

    final db = await open(); // Open the database

    try {
      await db.execute(sql); // Execute the SQL query
      print('Created table ${tableName} successful');
      return true; // Return true if successful
    } catch (e) {
      print(e); // Print the error if it occurs
      return false; // Return false if the operation fails
    }
  }

  Future<List<Map>> list(String tableName) async {
    final db = await open();
    return db.rawQuery('SELECT * FROM $tableName');
  }

  Future<Map?> getOneByWhere(
      String table, List<String> col, Map<String, dynamic> condition) async {
    final db = await open();
    String sqlWhere = '';
    List<dynamic> args = [];
    List<String> columnTrue = [];

    col.forEach((c) {
      columnTrue.add(splitString(c));
    });

    condition.forEach((key, value) {
      sqlWhere += '${key} =? and ';
      args.add(value);
    } as void Function(String key, dynamic value));

    sqlWhere = sqlWhere.substring(0, sqlWhere.length - 5);
    List<Map> maps = await db.query(table,
        columns: columnTrue, where: sqlWhere, whereArgs: args);
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return {};
  }

  // Insert a new object into the database
  Future<bool> insert(
      String tableNamed, List<String> columns, dynamic object) async {
    final db = await open();
    // Get the database instance
    try {
      await db.insert(tableNamed, toMap(columns, object)); // Insert the object
      return true;
    } catch (e) {
      print("Error inserting data: $e");
      return false;
    }
  }

  // Update an object in the database
  Future<bool> update(
    String tableName,
    List<String> columns,
    int id,
    dynamic object,
  ) async {
    final db = await open(); // Get the database instance
    try {
      await db.update(
        tableName,
        toMap(columns, object),
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      print("Error updating data: $e");
      return false;
    }
  }

  // Delete an object from the database
  Future<bool> delete(String tableName, int id) async {
    final db = await open(); // Get the database instance
    try {
      await db.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      print("Error deleting data: $e");
      return false;
    }
  }

  // Optionally, you can create a method to close the database when done
  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null; // Set the instance to null after closing
    }
  }

  //-------------------------------
  //methodh helper

  Map<String, dynamic> toMap(List<String> columns, dynamic object) {
    Map<String, Object?> map = {}; // Initialize the map
    //convert object to map
    String k;
    dynamic v;
    columns.forEach((column) {
      k = splitString(column); //key
      v = object.map()[
          k]; // value => the object must have a method map() who return object {"id": 1, ...}
      map[k] = v;
    });
    return map;
  }

  String splitString(String s) {
    return s.split(" ")[0];
  }
}
