part of 'manage_cart_bloc.dart';

abstract class ManageCartState extends Equatable {
  const ManageCartState();

  @override
  List<Object> get props => [];
}

class ManageCartInitial extends ManageCartState {}

class ManageCartLoading extends ManageCartState {}

class ManageCartSuccess extends ManageCartState {
  final String message;

  const ManageCartSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class ManageCartError extends ManageCartState {
  final String message;

  const ManageCartError(this.message);

  @override
  List<Object> get props => [message];
}
