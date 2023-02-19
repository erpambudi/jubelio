import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/domain/usecases/insert_cart_product.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late InsertCartProduct usecase;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockCartRepository = MockCartRepository();
    usecase = InsertCartProduct(mockCartRepository);
  });

  test('should insert products from the repository', () async {
    // arrange
    when(mockCartRepository.insertProduct(testCartProduct))
        .thenAnswer((_) async => const Right("Added to Cart"));
    // act
    final result = await usecase.execute(testCartProduct);
    // assert
    expect(result, const Right("Added to Cart"));
  });
}
