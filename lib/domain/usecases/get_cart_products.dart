import 'package:dartz/dartz.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/entities/cart.dart';
import 'package:jubelio/domain/repositories/cart_repository.dart';

class GetCartProducts {
  final CartRepository repository;

  GetCartProducts(this.repository);

  Future<Either<Failure, List<Cart>>> execute() {
    return repository.getCartData();
  }
}
