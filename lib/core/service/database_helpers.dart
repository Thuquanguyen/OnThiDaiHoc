import 'dart:io';
import 'package:flutterappdogandcat/core/model/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "Note.db";
  static final _databaseVersion = 1;
  static final tableName = "NoteItem";
  static final columnId = "id";
  static final columnSlug = "slug";
  static final columnTitle = "title";
  static final columnContent = "content";
  static final columnColors = "color";
  static final columnCreateAt = "createAt";

  //Tạo một class singletion
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //Mở kết nối tới database

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  //Mở database
  _initDatabase() async {
    //Lấy đường dẫn file data base trong Android và IOS sử dụng thư viện path_provider
    Directory documnetDirectory = await getApplicationDocumentsDirectory();
    String path = join(documnetDirectory.path, _databaseName);
    //Mở database
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  //Câu lệnh tạo database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName (
       $columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
       $columnSlug TEXT NOT NULL,
       $columnTitle TEXT NOT NULL,
       $columnContent TEXT NOT NULL,
       $columnColors INTEGER NOT NULL,
       $columnCreateAt TEXT NOT NULL
       )
    ''');
  }

  //Phương thức thêm vào database

  Future<int> insert(Note note) async {
    Database db = await database;
    int id = await db.insert(tableName, note.toMap());
    return id;
  }

  Future<List<Note>> queryAllNote() async {
    Database db = await database;
    var res = await db.query(tableName);
    List<Note> list =
        res.isNotEmpty ? res.map((c) => Note.fromMap(c)).toList() : [];
    return list;
  }

//Lấy dữ liệu từ database
  Future<Note> queryStation(int id) async {
    Database db = await database;
    // ignore: unnecessary_statements
    List<Map> maps = await db.query(tableName,
        columns: [
          columnId,
          columnSlug,
          columnTitle,
          columnContent,
          columnColors,
          columnCreateAt
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Note.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateNote(Note note) async {
    print("id = ${note.id}");
    final db = await database;
    return await db.update(tableName, note.toMap(),
        where: '$columnId = ?', whereArgs: [note.id]);
  }

  Future<int> deleteNote(int id) async {
    print("ID = $id");
    Database db = await database;
    return await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}
