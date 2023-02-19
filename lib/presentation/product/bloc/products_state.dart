part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsHasData extends ProductsState {
  final int currentPage;
  final List<Product> products;

  const ProductsHasData({
    required this.products,
    required this.currentPage,
  });

  @override
  List<Object> get props => [products, currentPage];
}

class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);

  @override
  List<Object> get props => [message];
}
