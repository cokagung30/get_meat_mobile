import 'dart:io';

import 'package:get_meat_apps/data/local/services/cart_local_services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class GetMeatDatabases {
  static GetMeatDatabases? _getMeatDatabases;
  static Database? _database;

  static const String _dbName = 'get_meat.db';

  static const _dbVersion1 = 1;

  CartLocalServices cartLocalServices = CartLocalServices();

  GetMeatDatabases._crateObject();

  factory GetMeatDatabases() {
    _getMeatDatabases ??= GetMeatDatabases._crateObject();
    return _getMeatDatabases!;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + _dbName;

    return await openDatabase(path, version: _dbVersion1,
        onCreate: (db, version) async {
      var batch = db.batch();

      cartLocalServices.onCreateCartTable(batch);
      await batch.commit();
    });
  }

  Future<Database> get database async {
    _database ??= await initDb();

    return _database!;
  }
}
