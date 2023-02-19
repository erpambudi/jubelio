import 'package:dartz/dartz.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/entities/cart.dart';
import 'package:jubelio/domain/repositories/cart_repository.dart';

class InsertCartProduct {
  final CartRepository repository;

  InsertCartProduct(this.repository);

  Future<Either<Failure, String>> execute(Cart cart) {
    return repository.insertProduct(cart);
  }
}
