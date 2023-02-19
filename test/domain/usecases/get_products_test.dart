import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/domain/usecases/get_products.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetProducts usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetProducts(mockProductRepository);
  });

  final tProducts = <Product>[];
  const int page = 1;
  const int perPage = 5;

  test('should get list of products from the repository', () async {
    // arrange
    when(mockProductRepository.getProducts(page, perPage))
        .thenAnswer((_) async => Right(tProducts));
    // act
    final result = await usecase.execute(page, perPage);
    // assert
    expect(result, Right(tProducts));
  });
}
