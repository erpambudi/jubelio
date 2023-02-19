part of 'cache_products_bloc.dart';

abstract class CacheProductsState extends Equatable {
  const CacheProductsState();

  @override
  List<Object> get props => [];
}

class CacheProductsInitial extends CacheProductsState {}

class CacheProductsLoading extends CacheProductsState {}

class CacheProductsHasData extends CacheProductsState {
  final List<ProductCache> products;

  const CacheProductsHasData({required this.products});

  @override
  List<Object> get props => [CacheProductsState];
}

class CacheProductsError extends CacheProductsState {
  final String message;

  const CacheProductsError(this.message);

  @override
  List<Object> get props => [message];
}
