part of 'cache_products_bloc.dart';

abstract class CacheProductsEvent extends Equatable {
  const CacheProductsEvent();

  @override
  List<Object> get props => [];
}

class GetCacheProductsEvent extends CacheProductsEvent {}
