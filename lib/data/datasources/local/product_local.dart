import 'package:jubelio/core/network/exceptions/database_exception.dart';
import 'package:jubelio/data/models/cart_table.dart';
import 'package:jubelio/data/models/product_cache.dart';

import 'database_helper.dart';

abstract class ProductLocal {
  Future<String> insertProduct(CartTable product);
  Future<String> removeProduct(CartTable product);
  Future<CartTable?> getProductById(int id);
  Future<List<CartTable>> getCartData();
  Future<String> updateQuantity(CartTable product, int quantity);

  Future<void> cacheProducts(List<ProductCacheModel> products);
  Future<List<ProductCacheModel>> getCachedProducts();
}

class ProductLocalImpl implements ProductLocal {
  final DatabaseHelper databaseHelper;

  ProductLocalImpl({required this.databaseHelper});

  @override
  Future<List<CartTable>> getCartData() async {
    final result = await databaseHelper.getCartData();
    return result.map((data) => CartTable.fromMap(data)).toList();
  }

  @override
  Future<CartTable?> getProductById(int id) async {
    final result = await databaseHelper.getCartTableById(id);
    if (result != null) {
      return CartTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<String> insertProduct(CartTable product) async {
    try {
      await databaseHelper.insertCartTable(product);
      return 'Added to Cart';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeProduct(CartTable product) async {
    try {
      await databaseHelper.removeCartTable(product);
      return 'Removed from Cart';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> updateQuantity(CartTable product, int quantity) async {
    try {
      await databaseHelper.updateQty(product, quantity);
      return 'Quantity Updated';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> cacheProducts(List<ProductCacheModel> products) async {
    await databaseHelper.clearProductCache();
    await databaseHelper.insertProductCache(products);
  }

  @override
  Future<List<ProductCacheModel>> getCachedProducts() async {
    final result = await databaseHelper.getCacheProducts();
    if (result.isNotEmpty) {
      return result.map((e) => ProductCacheModel.fromJson(e)).toList();
    } else {
      throw DatabaseException("Can't get the data.");
    }
  }
}
