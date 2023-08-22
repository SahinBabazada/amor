import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseHelper2 {
  static final DatabaseHelper2 _instance = DatabaseHelper2._();
  static Database? _database;

  DatabaseHelper2._();

  factory DatabaseHelper2() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'shopping_products.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS shopping_products (id TEXT PRIMARY KEY, quantity INTEGER)');
    });
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

  Future<List<Map<String, dynamic>>> getAllShoppingProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('shopping_products');
    return maps;
  }
}
