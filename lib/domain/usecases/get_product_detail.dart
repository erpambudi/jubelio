import 'package:dartz/dartz.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/domain/repositories/product_repository.dart';

class GetProductDetail {
  final ProductRepository repository;

  GetProductDetail(this.repository);

  Future<Either<Failure, Product>> execute(int id) {
    return repository.getProductDetail(id);
  }
}
