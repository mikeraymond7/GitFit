/*
// credit: https://www.youtube.com/watch?v=UpKrhZ0Hppk&ab_channel=JohannesMilke

// ignore_for_file: unused_local_variable

import 'package:git_fit/database/stats.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StatsDB {
  static final StatsDB instance = StatsDB._init();

  static Database? _database;

  StatsDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('stats.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const weightType = 'INTEGER';
    const heightType = 'INTEGER';
    const bmiType = 'INTEGER';

    //DROP TABLE IF EXISTS $tableStats;
    await db.execute('''
    CREATE TABLE $tableStats (
      ${StatsFields.id} $idType, 
      ${StatsFields.weight} $weightType,
      ${StatsFields.height} $heightType,
      ${StatsFields.bmi} $bmiType,
    )
    ''');
  }

  Future<Stats> create(Stats stats) async {
    final db = await instance.database;

    final json = stats.toJson();
    const columns =
        '${StatsFields.weight}, ${StatsFields.height}, ${StatsFields.bmi}';
    final values =
        '${json[StatsFields.weight]}, ${json[StatsFields.height]}, ${json[StatsFields.bmi]}';

    final id = await db.insert(tableStats, stats.toJson());
    return stats.copy(id: id);
  }

  Future<Stats?> readStats(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableStats,
      columns: StatsFields.values,
      where: '$StatsFields.id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Stats.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Stats>> readAllNotes() async {
    final db = await instance.database;

    const orderBy = '${StatsFields.id} ASC';

    // final result = await db.rawQuery('<enter Query>');

    final result = await db.query(tableStats, orderBy: orderBy);

    return result.map((json) => Stats.fromJson(json)).toList();
  }

  Future<int> update(Stats stats) async {
    final db = await instance.database;

    return db.update(
      tableStats,
      stats.toJson(),
      where: '${StatsFields.id} = ?',
      whereArgs: [stats.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableStats,
      where: '${StatsFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
*/