import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/usecases/get_products.dart';
import 'package:jubelio/presentation/product/bloc/products_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import 'products_bloc_test.mocks.dart';

@GenerateMocks([GetProducts])
void main() {
  late MockGetProducts mockGetProducts;
  late ProductsBloc productsBloc;

  setUp(() {
    mockGetProducts = MockGetProducts();
    productsBloc = ProductsBloc(mockGetProducts);
  });

  test('initial Products state should be initial', () {
    expect(productsBloc.state, ProductsInitial());
  });

  const int page = 1;
  const int perPage = 5;

  blocTest<ProductsBloc, ProductsState>(
    'Should Products emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetProducts.execute(page, perPage))
          .thenAnswer((_) async => Right(testProductsList));

      return productsBloc;
    },
    act: (bloc) => bloc.add(const GetProductsEvent()),
    expect: () => <ProductsState>[
      ProductsLoading(),
      ProductsHasData(products: testProductsList, currentPage: 1)
    ],
    verify: (bloc) {
      verify(mockGetProducts.execute(page, perPage));
    },
  );

  blocTest<ProductsBloc, ProductsState>(
    'Should Products emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(mockGetProducts.execute(page, perPage))
          .thenAnswer((_) async => const Left(ServerFailure("Server Failure")));

      return productsBloc;
    },
    act: (bloc) => bloc.add(const GetProductsEvent()),
    expect: () => <ProductsState>[
      ProductsLoading(),
      const ProductsError("Server Failure"),
    ],
    verify: (bloc) {
      verify(mockGetProducts.execute(page, perPage));
    },
  );
}
