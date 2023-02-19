import 'package:dartz/dartz.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/entities/product_cache.dart';
import 'package:jubelio/domain/repositories/product_repository.dart';

class GetProductsCached {
  final ProductRepository repository;

  GetProductsCached(this.repository);

  Future<Either<Failure, List<ProductCache>>> execute() {
    return repository.getProductsCache();
  }
}
