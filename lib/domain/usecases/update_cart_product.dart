import 'package:dartz/dartz.dart';
import 'package:jubelio/core/network/failure.dart';

import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class UpdateCartProduct {
  final CartRepository repository;

  UpdateCartProduct(this.repository);

  Future<Either<Failure, String>> execute(Cart cart, int quantity) {
    return repository.updateQuantity(cart, quantity);
  }
}
