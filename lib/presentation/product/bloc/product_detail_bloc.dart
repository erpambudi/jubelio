import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/domain/usecases/get_product_detail.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductDetail getProductDetail;

  ProductDetailBloc({required this.getProductDetail})
      : super(ProductDetailInitial()) {
    on<GetProductDetailEvent>((event, emit) async {
      emit(ProductDetailLoading());

      final result = await getProductDetail.execute(event.id);

      result.fold((failure) {
        emit(ProductDetailError(failure.message));
      }, (data) {
        emit(ProductDetailHasData(data));
      });
    });
  }
}
