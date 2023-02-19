part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class GetProductsEvent extends ProductsEvent {
  final int page;
  final int perPage;

  const GetProductsEvent({this.page = 1, this.perPage = 5});

  @override
  List<Object> get props => [page, perPage];
}
