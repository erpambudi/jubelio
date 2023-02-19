import 'package:jubelio/core/network/exceptions/base_exception.dart';
import 'package:jubelio/core/network/exceptions/database_exception.dart';
import 'package:jubelio/data/datasources/local/product_local.dart';
import 'package:jubelio/data/datasources/remote/product_remote.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:jubelio/domain/entities/product_cache.dart';
import 'package:jubelio/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemote remote;
  final ProductLocal local;

  ProductRepositoryImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, List<Product>>> getProducts(
      int page, int perPage) async {
    try {
      final products = await remote.getProducts(page, perPage);
      local.cacheProducts(products.map((e) => e.toProductCache()).toList());
      return Right(products.map((e) => e.toEntity()).toList());
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetail(int id) async {
    try {
      final product = await remote.getProductDetail(id);
      return Right(product.toEntity());
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductCache>>> getProductsCache() async {
    try {
      final result = await local.getCachedProducts();

      return Right(result.map((e) => e.toEntity()).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw Exception();
    }
  }
}
