import 'package:jubelio/core/network/exceptions/database_exception.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/data/datasources/local/product_local.dart';
import 'package:jubelio/data/models/cart_table.dart';
import 'package:jubelio/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';
import 'package:jubelio/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  ProductLocal productLocal;

  CartRepositoryImpl({required this.productLocal});

  @override
  Future<Either<Failure, List<Cart>>> getCartData() async {
    try {
      final result = await productLocal.getCartData();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Cart?> isAddedToCart(int id) async {
    final result = await productLocal.getProductById(id);

    return result?.toEntity();
  }

  @override
  Future<Either<Failure, String>> insertProduct(Cart cart) async {
    try {
      final result =
          await productLocal.insertProduct(CartTable.fromCartEntity(cart));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failure, String>> removeProduct(Cart cart) async {
    try {
      final result =
          await productLocal.removeProduct(CartTable.fromCartEntity(cart));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failure, String>> updateQuantity(
      Cart cart, int quantity) async {
    try {
      final result = await productLocal.updateQuantity(
          CartTable.fromCartEntity(cart), quantity);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw Exception();
    }
  }
}
