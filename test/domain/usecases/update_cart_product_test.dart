import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/domain/usecases/update_cart_product.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late UpdateCartProduct usecase;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockCartRepository = MockCartRepository();
    usecase = UpdateCartProduct(mockCartRepository);
  });

  test('should Update products from the repository', () async {
    // arrange
    when(mockCartRepository.updateQuantity(testCartProduct, 1))
        .thenAnswer((_) async => const Right("Quantity Updated"));
    // act
    final result = await usecase.execute(testCartProduct, 1);
    // assert
    expect(result, const Right("Quantity Updated"));
  });
}
