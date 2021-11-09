import 'package:scan_qrcode/model/nik_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'databasehelper.dart';

class AccountDb {
  AccountDb._privateConstructor();
  static final AccountDb instance = AccountDb._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await DatabaseHelper.instance.database;
    return _database;
  }

  Future<int> insertNikModelLocal(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    var result = await db!.insert(
      DatabaseHelper.tableUser,
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return result;
  }

  Future<NikModelLocal?> queryCustomer() async {
    Database? db = await instance.database;
    var result = await db!.query(DatabaseHelper.tableUser, limit: 1);
    
    if(result.isNotEmpty){
      return NikModelLocal.fromDb(result[0]);
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> queryAllRowsNikModelLocal() async {
    Database? db = await instance.database;
    return await db!.query(DatabaseHelper.tableUser);
  }

  Future<List<NikModelLocal>?> queryAllAccount() async {
    List<NikModelLocal>? result = [];
    Database? db = await instance.database;
    var list =
        await db!.query(DatabaseHelper.tableUser);
    if (list.isNotEmpty) {
      for (var i = 0; i < list.length; i++) {
        result.add(NikModelLocal.fromDb(list[i]));
      }
    }
    return result;
  }

  Future<int> updateNikModelLocal(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row['id'];
    return await db!.update(
        DatabaseHelper.tableUser, row,
        where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteNikModelLocal(int id) async {
    Database? db = await instance.database;
    return await db!.delete(
        DatabaseHelper.tableUser,
        where: 'id = ?',
        whereArgs: [id]);
  }

  Future<int> deleteAllNikModelLocal() async {
    Database? db = await instance.database;
    return await db!.delete(DatabaseHelper.tableUser);
  }
}
