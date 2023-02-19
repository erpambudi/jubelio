import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/usecases/get_cart_products.dart';
import 'package:jubelio/presentation/cart/bloc/cart_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import 'cart_bloc_test.mocks.dart';

@GenerateMocks([GetCartProducts])
void main() {
  late MockGetCartProducts mockGetCart;
  late CartBloc productsBloc;

  setUp(() {
    mockGetCart = MockGetCartProducts();
    productsBloc = CartBloc(getCartProducts: mockGetCart);
  });

  test('initial Cart state should be initial', () {
    expect(productsBloc.state, CartStateInitial());
  });

  blocTest<CartBloc, CartState>(
    'Should Cart emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetCart.execute())
          .thenAnswer((_) async => Right(testCartProductList));

      return productsBloc;
    },
    act: (bloc) => bloc.add(GetCartsEvent()),
    expect: () => <CartState>[
      CartStateLoaded(
          carts: testCartProductList, totalItems: 1, totalPrice: 12.99)
    ],
    verify: (bloc) {
      verify(mockGetCart.execute());
    },
  );

  blocTest<CartBloc, CartState>(
    'Should Cart emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(mockGetCart.execute()).thenAnswer(
          (_) async => const Left(DatabaseFailure('Error while loading cart')));

      return productsBloc;
    },
    act: (bloc) => bloc.add(GetCartsEvent()),
    expect: () => <CartState>[
      const CartStateError('Error while loading cart'),
    ],
    verify: (bloc) {
      verify(mockGetCart.execute());
    },
  );
}
