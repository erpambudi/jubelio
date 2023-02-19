part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
}

class GetProductDetailEvent extends ProductDetailEvent {
  final int id;

  const GetProductDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
