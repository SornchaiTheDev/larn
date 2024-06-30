import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final db = DbService().db;

class DbService {
  Database? db;
  static final DbService _instance = DbService._internal();

  factory DbService() {
    return _instance;
  }

  DbService._internal();

  Future<String> getDBPath() async {
    return join(await getDatabasesPath(), 'app.db');
  }

  Future<bool> checkDatabase() async {
    String path = await getDBPath();
    bool exists = await databaseExists(path);
    return exists;
  }

  Future<void> initDB() async {
    String path = await getDBPath();

    // deleteDatabase(path);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE larns (id VARCHAR PRIMARY KEY, name VARCHAR, description TEXT, image VARCHAR)');
      await db.execute(
          'CREATE TABLE apps (id VARCHAR PRIMARY KEY, name VARCHAR, description TEXT, image VARCHAR, larn_id VARCHAR, FOREIGN KEY(larn_id) REFERENCES larns(id))');
      await db.execute(
        'CREATE TABLE chat_histories (id INTEGER PRIMARY KEY AUTOINCREMENT, type VARCHAR, content TEXT, timestamp DATETIME, side VARCHAR, larn_id VARCHAR, FOREIGN KEY(larn_id) REFERENCES larns(id))',
      );
    });
  }
}
