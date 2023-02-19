part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartStateInitial extends CartState {}

class CartStateLoading extends CartState {}

class CartStateLoaded extends CartState {
  final List<Cart> carts;
  final int totalItems;
  final double totalPrice;

  const CartStateLoaded(
      {required this.carts,
      required this.totalPrice,
      required this.totalItems});

  @override
  List<Object> get props => [carts, totalItems, totalPrice];
}

class CartStateError extends CartState {
  final String message;

  const CartStateError(this.message);

  @override
  List<Object> get props => [message];
}
