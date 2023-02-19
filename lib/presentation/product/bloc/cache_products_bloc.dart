import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jubelio/domain/entities/product_cache.dart';
import 'package:jubelio/domain/usecases/get_products_cached.dart';

part 'cache_products_event.dart';
part 'cache_products_state.dart';

class CacheProductsBloc extends Bloc<CacheProductsEvent, CacheProductsState> {
  final GetProductsCached getProductsCached;

  CacheProductsBloc({required this.getProductsCached})
      : super(CacheProductsInitial()) {
    on<GetCacheProductsEvent>((event, emit) async {
      emit(CacheProductsLoading());

      final result = await getProductsCached.execute();

      result.fold(
        (failure) => emit(CacheProductsError(failure.message)),
        (products) => emit(CacheProductsHasData(products: products)),
      );
    });
  }
}
