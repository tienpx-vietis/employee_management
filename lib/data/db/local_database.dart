import 'dart:async';

import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class LocalDatabase {
  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      return await _openDatabase();
    }
    return _database!;
  }

  Future<Database> _openDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, 'vietis.db');
    final db = await databaseFactoryIo.openDatabase(dbPath);
    _database = db;
    return db;
  }
}
