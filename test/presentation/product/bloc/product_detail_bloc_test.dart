import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/core/network/failure.dart';
import 'package:jubelio/domain/usecases/get_product_detail.dart';
import 'package:jubelio/presentation/product/bloc/product_detail_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import 'product_detail_bloc_test.mocks.dart';

@GenerateMocks([GetProductDetail])
void main() {
  late MockGetProductDetail mockGetProductDetail;
  late ProductDetailBloc productDetailBloc;

  setUp(() {
    mockGetProductDetail = MockGetProductDetail();
    productDetailBloc =
        ProductDetailBloc(getProductDetail: mockGetProductDetail);
  });

  test('initial Products state should be initial', () {
    expect(productDetailBloc.state, ProductDetailInitial());
  });

  const int idProduct = 1;

  blocTest<ProductDetailBloc, ProductDetailState>(
    'Should Detail Product emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetProductDetail.execute(idProduct))
          .thenAnswer((_) async => const Right(testProduct));

      return productDetailBloc;
    },
    act: (bloc) => bloc.add(const GetProductDetailEvent(idProduct)),
    expect: () => <ProductDetailState>[
      ProductDetailLoading(),
      const ProductDetailHasData(testProduct),
    ],
    verify: (bloc) {
      verify(mockGetProductDetail.execute(idProduct));
    },
  );

  blocTest<ProductDetailBloc, ProductDetailState>(
    'Should Detail Product emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(mockGetProductDetail.execute(idProduct))
          .thenAnswer((_) async => const Left(ServerFailure("Server Failure")));

      return productDetailBloc;
    },
    act: (bloc) => bloc.add(const GetProductDetailEvent(idProduct)),
    expect: () => <ProductDetailState>[
      ProductDetailLoading(),
      const ProductDetailError("Server Failure"),
    ],
    verify: (bloc) {
      verify(mockGetProductDetail.execute(idProduct));
    },
  );
}
