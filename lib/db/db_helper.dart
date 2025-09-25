import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note.dart';

class DBHelper {
  static Database? _db;
  static const String DB_NAME = "notes.db";
  static const String TABLE = "notes";

  static Future<Database> getDB() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), DB_NAME);
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $TABLE(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT,
            date TEXT
          )
        ''');
      },
    );
    return _db!;
  }

  static Future<int> insert(Note note) async {
    final db = await getDB();
    return await db.insert(TABLE, note.toMap());
  }

  static Future<List<Note>> getNotes() async {
    final db = await getDB();
    final maps = await db.query(TABLE, orderBy: "id DESC");
    return maps.map((e) => Note.fromMap(e)).toList();
  }

  static Future<int> update(Note note) async {
    final db = await getDB();
    return await db.update(
      TABLE,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  static Future<int> delete(int id) async {
    final db = await getDB();
    return await db.delete(TABLE, where: 'id = ?', whereArgs: [id]);
  }
}
