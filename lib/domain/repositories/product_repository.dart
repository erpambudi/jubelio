import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:jubelio/domain/entities/product_cache.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts(int page, int perPage);
  Future<Either<Failure, Product>> getProductDetail(int id);

  Future<Either<Failure, List<ProductCache>>> getProductsCache();
}
