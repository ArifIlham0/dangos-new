import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StorageHelper {
  static final StorageHelper _instance = StorageHelper._internal();
  static Database? _database;

  factory StorageHelper() {
    return _instance;
  }

  StorageHelper._internal();

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'dangos_storage.db');
    // await deleteDatabase(path);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE storage (
            key TEXT PRIMARY KEY,
            value TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE cache (
            key TEXT PRIMARY KEY,
            value TEXT
          )
        ''');
      },
    );
  }

  Future<Database> get _db async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<void> setCache(String key, String value) async {
    final db = await _db;
    await db.insert(
      'cache',
      {'key': key, 'value': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String?> getCache(String key) async {
    final db = await _db;
    final result = await db.query(
      'cache',
      where: 'key = ?',
      whereArgs: [key],
    );

    if (result.isNotEmpty) {
      return result.first['value'] as String;
    }
    return null;
  }

  Future<void> removeCache(String key) async {
    final db = await _db;
    await db.delete(
      'cache',
      where: 'key = ?',
      whereArgs: [key],
    );
  }
  
  Future<void> setStorage(String key, String value) async {
    final db = await _db;
    await db.insert(
      'storage',
      {'key': key, 'value': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String?> getStorage(String key) async {
    final db = await _db;
    final result = await db.query(
      'storage',
      where: 'key = ?',
      whereArgs: [key],
    );

    if (result.isNotEmpty) {
      return result.first['value'] as String;
    }
    return null;
  }

  Future<void> removeStorage(String key) async {
    final db = await _db;
    await db.delete(
      'storage',
      where: 'key = ?',
      whereArgs: [key],
    );
  }

  Future<void> clearCache() async {
    final db = await _db;
    await db.delete('cache');
  }

  Future<void> clearStorage() async {
    final db = await _db;
    await db.delete('storage');
  }
}
