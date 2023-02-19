part of 'manage_cart_bloc.dart';

abstract class ManageCartEvent extends Equatable {
  const ManageCartEvent();

  @override
  List<Object> get props => [];
}

class SaveCartProductEvent extends ManageCartEvent {
  final Cart product;

  const SaveCartProductEvent(this.product);
}

class AddQuantityProductEvent extends ManageCartEvent {
  final Cart cart;

  const AddQuantityProductEvent(this.cart);
}

class ReduceQuantityProductEvent extends ManageCartEvent {
  final Cart cart;

  const ReduceQuantityProductEvent(this.cart);
}

class RemoveCartProductEvent extends ManageCartEvent {
  final Cart cart;

  const RemoveCartProductEvent(this.cart);
}
