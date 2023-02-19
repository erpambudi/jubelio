import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/domain/usecases/insert_cart_product.dart';
import 'package:jubelio/domain/usecases/remove_cart_product.dart';
import 'package:jubelio/domain/usecases/update_cart_product.dart';
import 'package:jubelio/presentation/cart/bloc/manage_cart_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import 'manage_cart_bloc_test.mocks.dart';

@GenerateMocks([
  InsertCartProduct,
  RemoveCartProduct,
  UpdateCartProduct,
])
void main() {
  late MockInsertCartProduct mockInsertCartProduct;
  late MockRemoveCartProduct mockRemoveCartProduct;
  late MockUpdateCartProduct mockUpdateCartProduct;
  late ManageCartBloc manageCartBloc;

  setUp(() {
    mockInsertCartProduct = MockInsertCartProduct();
    mockRemoveCartProduct = MockRemoveCartProduct();
    mockUpdateCartProduct = MockUpdateCartProduct();

    manageCartBloc = ManageCartBloc(
      insertCartProduct: mockInsertCartProduct,
      removeCartProduct: mockRemoveCartProduct,
      updateCartProduct: mockUpdateCartProduct,
    );
  });

  test('initial Cart state should be initial', () {
    expect(manageCartBloc.state, ManageCartInitial());
  });

  blocTest<ManageCartBloc, ManageCartState>(
    'Should Insert Cart emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockInsertCartProduct.execute(testCartProduct))
          .thenAnswer((_) async => const Right("Added to Cart"));

      return manageCartBloc;
    },
    act: (bloc) => bloc.add(SaveCartProductEvent(testCartProduct)),
    expect: () => <ManageCartState>[
      ManageCartLoading(),
      const ManageCartSuccess("Added to Cart")
    ],
    verify: (bloc) {
      verify(mockInsertCartProduct.execute(testCartProduct));
    },
  );

  blocTest<ManageCartBloc, ManageCartState>(
    'Should Remove Cart emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockRemoveCartProduct.execute(testCartProduct))
          .thenAnswer((_) async => const Right("Removed from Cart"));

      return manageCartBloc;
    },
    act: (bloc) => bloc.add(RemoveCartProductEvent(testCartProduct)),
    expect: () =>
        <ManageCartState>[const ManageCartSuccess("Removed from Cart")],
    verify: (bloc) {
      verify(mockRemoveCartProduct.execute(testCartProduct));
    },
  );

  blocTest<ManageCartBloc, ManageCartState>(
    'Should Add Quantity Cart emit [Loading, HasData] when data is gotten successfully',
    build: () {
      int quantity = testCartProduct.quantity! + 1;

      when(mockUpdateCartProduct.execute(testCartProduct, quantity))
          .thenAnswer((_) async => const Right("Quantity Updated"));

      return manageCartBloc;
    },
    act: (bloc) => bloc.add(AddQuantityProductEvent(testCartProduct)),
    expect: () => <ManageCartState>[
      ManageCartLoading(),
      const ManageCartSuccess("Quantity Updated")
    ],
    verify: (bloc) {
      verify(mockUpdateCartProduct.execute(testCartProduct, 2));
    },
  );

  blocTest<ManageCartBloc, ManageCartState>(
    'Should Reduce Quantity Cart emit [Loading, HasData] when data is gotten successfully',
    build: () {
      int quantity = testCartQuantityProduct.quantity! - 1;

      when(mockUpdateCartProduct.execute(testCartQuantityProduct, quantity))
          .thenAnswer((_) async => const Right("Quantity Updated"));

      return manageCartBloc;
    },
    act: (bloc) =>
        bloc.add(ReduceQuantityProductEvent(testCartQuantityProduct)),
    expect: () =>
        <ManageCartState>[const ManageCartSuccess("Quantity Updated")],
    verify: (bloc) {
      verify(mockUpdateCartProduct.execute(testCartQuantityProduct, 1));
    },
  );
}
