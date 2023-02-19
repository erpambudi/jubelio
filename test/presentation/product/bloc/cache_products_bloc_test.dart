import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/usecases/get_products_cached.dart';
import 'package:jubelio/presentation/product/bloc/cache_products_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import 'cache_products_bloc_test.mocks.dart';

@GenerateMocks([GetProductsCached])
void main() {
  late MockGetProductsCached mockGetCacheProducts;
  late CacheProductsBloc cacheProductsBloc;

  setUp(() {
    mockGetCacheProducts = MockGetProductsCached();
    cacheProductsBloc =
        CacheProductsBloc(getProductsCached: mockGetCacheProducts);
  });

  test('initial CacheProducts state should be initial', () {
    expect(cacheProductsBloc.state, CacheProductsInitial());
  });

  blocTest<CacheProductsBloc, CacheProductsState>(
    'Should CacheProducts emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetCacheProducts.execute())
          .thenAnswer((_) async => Right(testCacheProductList));

      return cacheProductsBloc;
    },
    act: (bloc) => bloc.add(GetCacheProductsEvent()),
    expect: () => <CacheProductsState>[
      CacheProductsLoading(),
      CacheProductsHasData(products: testCacheProductList),
    ],
    verify: (bloc) {
      verify(mockGetCacheProducts.execute());
    },
  );

  blocTest<CacheProductsBloc, CacheProductsState>(
    'Should CacheProducts emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(mockGetCacheProducts.execute())
          .thenAnswer((_) async => const Left(ServerFailure("Server Failure")));

      return cacheProductsBloc;
    },
    act: (bloc) => bloc.add(GetCacheProductsEvent()),
    expect: () => <CacheProductsState>[
      CacheProductsLoading(),
      const CacheProductsError("Server Failure"),
    ],
    verify: (bloc) {
      verify(mockGetCacheProducts.execute());
    },
  );
}
