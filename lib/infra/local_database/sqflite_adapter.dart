import 'package:barcode_reader/data/local_database/local_database.dart';
import 'package:barcode_reader/data/local_database/local_database_delete.dart';
import 'package:barcode_reader/data/local_database/local_database_error.dart';
import 'package:barcode_reader/data/local_database/local_database_fetch.dart';
import 'package:sqflite/sqflite.dart';

class SQFLiteAdapter implements LocalDatabaseFetch, LocalDatabaseSave, LocalDatabaseDelete {
  late final Database db;
  static late final SQFLiteAdapter _instance;

  static SQFLiteAdapter get instance {
    return _instance;
  }

  static Future<void> initialize() async {
    _instance = SQFLiteAdapter();
    _instance.db = await openDatabase(
      "app.db",
      version: 1,
      onCreate: (db, _) async {
        const createTableCodesIfNotExists = 'CREATE TABLE IF NOT EXISTS codes';
        const defineTypes = '(id INTEGER PRIMARY KEY, title VARCHAR(255), code VARCHAR(255))';
        await db.execute("$createTableCodesIfNotExists $defineTypes");
      },
    );
  }

  @override
  Future<List<Map<String, dynamic>>> readAll(String tableName) async {
    try {
      final db = await openDatabase("app.db");
      return await db.query("codes");
    } catch (err) {
      throw LocalDatabaseError.loadError;
    }
  }

  @override
  Future<int> save({required String table, required Map<String, dynamic> values}) async {
    try {
      final db = await openDatabase("app.db");
      final insertValues = values.values.toList();
      final insertKeys = values.keys;
      final valuePlaceholder = List.filled(insertKeys.length, "?");

      return await db.rawInsert(
        'INSERT INTO $table $insertKeys VALUES (${valuePlaceholder.join(',')})',
        insertValues,
      );
    } catch (err) {
      throw LocalDatabaseError.saveError;
    }
  }

  @override
  Future<void> delete({required String table, required Map<String, dynamic> where}) async {
    try {
      final db = await openDatabase("app.db");
      var stringWhere = "";
      where.forEach((key, value) => stringWhere += "$key = ?");
      await db.delete(table, where: stringWhere, whereArgs: where.values.toList());
    } catch (err) {
      throw LocalDatabaseError.saveError;
    }
  }
}
