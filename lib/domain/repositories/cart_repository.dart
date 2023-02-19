import 'package:dartz/dartz.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getCartData();
  Future<Cart?> isAddedToCart(int id);
  Future<Either<Failure, String>> insertProduct(Cart cart);
  Future<Either<Failure, String>> removeProduct(Cart cart);
  Future<Either<Failure, String>> updateQuantity(Cart cart, int quantity);
}
