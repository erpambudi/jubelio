import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/data/datasources/local/product_local.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late ProductLocalImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = ProductLocalImpl(databaseHelper: mockDatabaseHelper);
  });

  group('Products Cache', () {
    test('Should return list of product from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheProducts())
          .thenAnswer((_) async => [testCacheProductMap]);
      // act
      final result = await dataSource.getCachedProducts();
      // assert
      expect(result, [testCacheProductModel]);
    });
  });

  group('Products Cart', () {
    test('Should return list of cart from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCartData())
          .thenAnswer((_) async => [testCartProductMap]);
      // act
      final result = await dataSource.getCartData();
      // assert
      expect(result, [testCartProductModel]);
    });
  });

  test('should return success message when insert to database is success',
      () async {
    // arrange
    when(mockDatabaseHelper.insertCartTable(testCartProductModel))
        .thenAnswer((_) async => 1);
    // act
    final result = await dataSource.insertProduct(testCartProductModel);
    // assert
    expect(result, 'Added to Cart');
  });

  test('should return success message when remove to database is success',
      () async {
    // arrange
    when(mockDatabaseHelper.removeCartTable(testCartProductModel))
        .thenAnswer((_) async => 1);
    // act
    final result = await dataSource.removeProduct(testCartProductModel);
    // assert
    expect(result, 'Removed from Cart');
  });
}
