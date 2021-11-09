import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:scan_qrcode/util/constant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final String _dbName = Constant.dbName;
  static final int _dbVersion = Constant.dbVersion;
  static final String tableUser = Constant.tableUser;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);

    return await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database db, int version) async {
    createDatabaseTable(db, version);
  }

  Future createDatabaseTable(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableUser(
      id INTEGER PRIMARY KEY,
      nik TEXT,
      name TEXT,
      gender TEXT,
      bornDate TEXT,
      province TEXT,
      city TEXT,
      subdistrict TEXT,
      uniqueCode TEXT,
      postalCode TEXT,
      age TEXT,
      ageYear TEXT,
      ageMonth TEXT,
      ageDay TEXT,
      nextBirthday TEXT,
      zodiac TEXT,
      valid TEXT
    )
    ''');
  }

  Future _onUpgrade(Database db, int currentVersion, int newVersion) async {
    print('- ONUPGRADE -');
    print('cur version ' + currentVersion.toString());
    print('new version ' + newVersion.toString());
    if (currentVersion < newVersion) {
      migration1_2.forEach((script) async => await db.execute(script));
    }
  }

  var migration1_2 = [
    '''
          ALTER TABLE $tableUser ADD COLUMN postalCode TEXT
          '''
  ];
}
