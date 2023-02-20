import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/core/network/exceptions/database_exception.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/data/repositories/cart_repository_impl.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late CartRepositoryImpl repository;
  late MockProductLocal mockProductLocal;

  setUp(() {
    mockProductLocal = MockProductLocal();
    repository = CartRepositoryImpl(productLocal: mockProductLocal);
  });

  group('Get Cart', () {
    test('should return cart list when call to data source is success',
        () async {
      // arrange
      when(mockProductLocal.getCartData())
          .thenAnswer((_) async => testCartProductModelList);
      // act
      final result = await repository.getCartData();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, testCartProductList);
    });

    test(
        'should return database failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockProductLocal.getCartData()).thenThrow(DatabaseException(''));
      // act
      final result = await repository.getCartData();
      // assert
      expect(result, const Left(DatabaseFailure('')));
    });
  });

  group('Insert Cart', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockProductLocal.insertProduct(testCartProductModel))
          .thenAnswer((_) async => "Added to Cart");
      // act
      final result = await repository.insertProduct(testCartProduct);
      // assert
      expect(result, const Right('Added to Cart'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockProductLocal.insertProduct(testCartProductModel))
          .thenThrow(DatabaseException(''));
      // act
      final result = await repository.insertProduct(testCartProduct);
      // assert
      expect(result, const Left(DatabaseFailure('')));
    });
  });

  group('Remove Cart', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockProductLocal.removeProduct(testCartProductModel))
          .thenAnswer((_) async => "Removed to Cart");
      // act
      final result = await repository.removeProduct(testCartProduct);
      // assert
      expect(result, const Right('Removed to Cart'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockProductLocal.removeProduct(testCartProductModel))
          .thenThrow(DatabaseException(''));
      // act
      final result = await repository.removeProduct(testCartProduct);
      // assert
      expect(result, const Left(DatabaseFailure('')));
    });
  });

  group('Update Quantity Cart', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockProductLocal.updateQuantity(testCartQuantityModelProduct, 1))
          .thenAnswer((_) async => "Quantity Updated");
      // act
      final result =
          await repository.updateQuantity(testCartQuantityProduct, 1);
      // assert
      expect(result, const Right('Quantity Updated'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockProductLocal.updateQuantity(testCartQuantityModelProduct, 1))
          .thenThrow(DatabaseException(''));
      // act
      final result =
          await repository.updateQuantity(testCartQuantityProduct, 1);
      // assert
      expect(result, const Left(DatabaseFailure('')));
    });
  });
}
