import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uas_zan_2042074/models/Keluhan.dart';

class DbKeluh {

  Database database;

  Future initDB() async {
    if (database != null) {
      return database;
    }

    String databasesPath = await getDatabasesPath();

    database = await openDatabase(
      join(databasesPath, 'keluh.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE trans(id INTEGER PRIMARY KEY, date TEXT, nama TEXT, keluh TEXT)",
        );
      },
      version: 1,
    );

    return database;
  }

  void insertKeluhan(Keluhan keluhan) async {
    final Database db = database;

    db.insert(
      'keluhan',
      keluhan.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Keluhan>> keluhan() async {
    final Database db = database;

    final List<Map<String, dynamic>> maps = await db.query('keluhan');

    return List.generate(maps.length, (i) {
      return Keluhan(
        id: maps[i]['id'],
        Date: maps[i]['date'],
        Nama: maps[i]['nama'],
        Keluh: maps[i]['keluhan'],
      );
    });
  }

  Future<int> countTotal() async {

  }

  Future<void> updateKeluhan(Keluhan keluhan) async {
    final db = database;

    await db.update(
      'keluhan',
      keluhan.toMap(),
      where: "id = ?",
      whereArgs: [keluhan.id],
    );
  }

  Future<void> deleteKeluhan(int id) async {
    final db = database;

    await db.delete(
      'keluhan',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}