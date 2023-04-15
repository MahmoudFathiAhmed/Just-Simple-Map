import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotificationDatabase {
  static final NotificationDatabase instance = NotificationDatabase._init();

  static Database? _database;

  NotificationDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notifications.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notifications (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        body TEXT,
        time INTEGER
      )
    ''');
  }

  Future<int> addNotification(String title, String body, int time) async {
    final db = await instance.database;

    return await db.insert('notifications', {
      'title': title,
      'body': body,
      'time': time,
    });
  }

  Future<List<Map<String, dynamic>>> getNotifications() async {
    final db = await instance.database;
    const orderBy = 'time DESC';

    return await db.query('notifications', orderBy: orderBy);
  }
}
