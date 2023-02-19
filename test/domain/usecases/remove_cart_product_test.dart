import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/domain/usecases/remove_cart_product.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveCartProduct usecase;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockCartRepository = MockCartRepository();
    usecase = RemoveCartProduct(mockCartRepository);
  });

  test('should Remove products from the repository', () async {
    // arrange
    when(mockCartRepository.removeProduct(testCartProduct))
        .thenAnswer((_) async => const Right("Removed from Cart"));
    // act
    final result = await usecase.execute(testCartProduct);
    // assert
    expect(result, const Right("Removed from Cart"));
  });
}
