import 'dart:async';

import 'package:jubelio/data/models/product_cache.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/cart_table.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblCache = 'products_cache';
  static const String _tblCart = 'cart';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/elevenia_jubelio.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblCache (
        id INTEGER PRIMARY KEY,
        name TEXT,
        price TEXT,
        image TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE  $_tblCart (
        id INTEGER PRIMARY KEY,
        idProduct INTEGER,
        name TEXT,
        price TEXT,
        quantity INTEGER,
        image TEXT,
        size TEXT,
        brand TEXT
      );
    ''');
  }

  // Cart
  Future<int> insertCartTable(CartTable cartTable) async {
    final db = await database;
    return await db!.insert(_tblCart, cartTable.toMap());
  }

  Future<int> removeCartTable(CartTable cartTable) async {
    final db = await database;
    return await db!.delete(
      _tblCart,
      where: 'id = ?',
      whereArgs: [cartTable.id],
    );
  }

  Future<int> updateQty(CartTable cartTable, int quantity) async {
    final db = await database;
    return await db!.update(
      _tblCart,
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [cartTable.id],
    );
  }

  Future<Map<String, dynamic>?> getCartTableById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblCart,
      where: 'idProduct = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getCartData() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblCart);

    return results;
  }

  // Cache
  Future<void> insertProductCache(List<ProductCacheModel> products) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final product in products) {
        final productJson = product.toJson();
        txn.insert(_tblCache, productJson);
      }
    });
  }

  Future<List<Map<String, dynamic>>> getCacheProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblCache);

    return results;
  }

  Future<int> clearProductCache() async {
    final db = await database;
    return await db!.delete(_tblCache);
  }
}
