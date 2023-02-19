import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/domain/entities/cart.dart';
import 'package:jubelio/domain/usecases/get_cart_products.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCartProducts usecase;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockCartRepository = MockCartRepository();
    usecase = GetCartProducts(mockCartRepository);
  });

  final tProducts = <Cart>[];

  test('should get list of products from the repository', () async {
    // arrange
    when(mockCartRepository.getCartData())
        .thenAnswer((_) async => Right(tProducts));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tProducts));
  });
}
