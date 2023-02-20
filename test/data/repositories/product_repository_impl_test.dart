import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/core/network/exceptions/app_exception.dart';
import 'package:jubelio/core/network/exceptions/database_exception.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/data/repositories/product_repository_impl.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemote mockProductRemote;
  late MockProductLocal mockProductLocal;

  setUp(() {
    mockProductRemote = MockProductRemote();
    mockProductLocal = MockProductLocal();
    repository = ProductRepositoryImpl(
        remote: mockProductRemote, local: mockProductLocal);
  });

  const int page = 1;
  const int perPage = 5;

  group('Products', () {
    test('should return product list when call to data source is success',
        () async {
      // arrange
      when(mockProductRemote.getProducts(page, perPage))
          .thenAnswer((_) async => testProductsModelList);
      // act
      final result = await repository.getProducts(page, perPage);
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, testProductsList);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockProductRemote.getProducts(page, perPage))
          .thenThrow(AppException(message: ''));
      // act
      final result = await repository.getProducts(page, perPage);
      // assert
      expect(result, const Left(ServerFailure('')));
    });
  });

  group('Detail Product', () {
    int tId = 186;

    test('should return product list when call to data source is success',
        () async {
      // arrange
      when(mockProductRemote.getProductDetail(tId))
          .thenAnswer((_) async => testProductModel);
      // act
      final result = await repository.getProductDetail(tId);
      // assert
      expect(result, equals(const Right(testProduct)));
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockProductRemote.getProductDetail(tId))
          .thenThrow(AppException(message: ''));
      // act
      final result = await repository.getProductDetail(tId);
      // assert
      expect(result, const Left(ServerFailure('')));
    });
  });

  group('Product Cache', () {
    test('should return product cache list when call to data source is success',
        () async {
      // arrange
      when(mockProductLocal.getCachedProducts())
          .thenAnswer((_) async => testCacheProductModelList);
      // act
      final result = await repository.getProductsCache();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, testCacheProductList);
    });

    test(
        'should return database failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockProductLocal.getCachedProducts())
          .thenThrow(DatabaseException(''));
      // act
      final result = await repository.getProductsCache();
      // assert
      expect(result, const Left(DatabaseFailure('')));
    });
  });
}
