import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'saved_products.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS saved_products (id TEXT PRIMARY KEY)');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS shopping_products (id TEXT PRIMARY KEY, quantity INTEGER)');
    });
  }

  Future<void> saveProduct(String productId) async {
    final db = await database;
    await db.insert('saved_products', {'id': productId},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> addProductToShoppingList(String productId, int quantity) async {
    final db = await database;
    await db.insert(
        'shopping_products', {'id': productId, 'quantity': quantity},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<bool> isProductAdded(String productId) async {
    final db = await database;
    final result = await db
        .query('shopping_products', where: 'id = ?', whereArgs: [productId]);
    return result.isNotEmpty;
  }

  Future<void> removeShoppingProduct(String productId) async {
    final db = await database;
    await db
        .delete('shopping_products', where: 'id = ?', whereArgs: [productId]);
  }

  Future<List<String>> getAllShoppingProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('shopping_products');
    return List.generate(maps.length, (i) {
      return maps[i]['id'] as String;
    });
  }

  Future<bool> isProductSaved(String productId) async {
    final db = await database;
    final result = await db
        .query('saved_products', where: 'id = ?', whereArgs: [productId]);
    return result.isNotEmpty;
  }

  Future<void> removeProduct(String productId) async {
    final db = await database;
    await db.delete('saved_products', where: 'id = ?', whereArgs: [productId]);
  }

  Future<List<String>> getAllSavedProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('saved_products');
    return List.generate(maps.length, (i) {
      return maps[i]['id'] as String;
    });
  }
}
