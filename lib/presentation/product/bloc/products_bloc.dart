import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/domain/usecases/get_products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts _getProducts;

  ProductsBloc(this._getProducts) : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductsLoading());

      final result = await _getProducts.execute(event.page, event.perPage);

      result.fold(
        (failure) => emit(ProductsError(failure.message)),
        (products) =>
            emit(ProductsHasData(products: products, currentPage: event.page)),
      );
    });
  }
}
