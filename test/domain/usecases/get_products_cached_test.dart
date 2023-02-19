import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/domain/entities/product_cache.dart';
import 'package:jubelio/domain/usecases/get_products_cached.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetProductsCached usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetProductsCached(mockProductRepository);
  });

  final tProducts = <ProductCache>[];

  test('should get list of products cache from the repository', () async {
    // arrange
    when(mockProductRepository.getProductsCache())
        .thenAnswer((_) async => Right(tProducts));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tProducts));
  });
}
