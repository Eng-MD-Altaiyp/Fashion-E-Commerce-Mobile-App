import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase_Metter {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initializeDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> _initializeDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'Shop_Store.db');
    Database myDb = await openDatabase(
      path,
      version: 1,
      onUpgrade: _onUpgrade,
      onCreate: _onCreate,
    );
    return myDb;
  }

  // تُستدعى عند ترقية إصدار قاعدة البيانات
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("onUpgrade: Upgrading database from version $oldVersion to $newVersion");
  }

  // تُستدعى عند إنشاء قاعدة البيانات لأول مرة
  Future<void> _onCreate(Database db, int version) async {
    try {
      await db.execute('''
        CREATE TABLE products( 
          products_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          products_name TEXT NOT NULL,
          products_price DOUBLE NOT NULL,
          products_favorite INTEGER NOT NULL,
          products_cart INTEGER NOT NULL,
          products_counter INTEGER NOT NULL,
          products_category TEXT NOT NULL,
          products_description TEXT NOT NULL,
          products_image TEXT NOT NULL
        )
      ''');
      await db.execute('''
        CREATE TABLE search( 
          search_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          search_title TEXT NOT NULL,
          search_name TEXT NOT NULL
        )
      ''');
      print("Database created successfully!");
    } catch (error) {
      print("Error while creating database: $error");
    }
  }

  // قراءة البيانات باستخدام المعاملات المضمّنة
  Future<List<Map<String, dynamic>>> readData(String sql, [List<dynamic>? args]) async {
    final myDb = await db;
    return await myDb!.rawQuery(sql, args);
  }

  // إدخال البيانات باستخدام المعاملات المضمّنة
  Future<int> insertData(String sql, [List<dynamic>? args]) async {
    final myDb = await db;
    return await myDb!.rawInsert(sql, args);
  }

  // تحديث البيانات باستخدام المعاملات المضمّنة
  Future<int> updateData(String sql, [List<dynamic>? args]) async {
    final myDb = await db;
    return await myDb!.rawUpdate(sql, args);
  }

  // حذف البيانات باستخدام المعاملات المضمّنة
  Future<int> deleteData(String sql, [List<dynamic>? args]) async {
    final myDb = await db;
    return await myDb!.rawDelete(sql, args);
  }
}
