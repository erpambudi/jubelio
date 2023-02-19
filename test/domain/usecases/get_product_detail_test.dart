import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/domain/usecases/get_product_detail.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetProductDetail usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetProductDetail(mockProductRepository);
  });

  const int id = 1;

  test('should get product from the repository', () async {
    // arrange
    when(mockProductRepository.getProductDetail(id))
        .thenAnswer((_) async => const Right(testProduct));
    // act
    final result = await usecase.execute(id);
    // assert
    expect(result, const Right(testProduct));
  });
}
