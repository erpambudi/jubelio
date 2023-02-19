import 'package:dartz/dartz.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Either<Failure, List<Product>>> execute(int page, int perPage) {
    return repository.getProducts(page, perPage);
  }
}
