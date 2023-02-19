import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jubelio/domain/entities/cart.dart';
import 'package:jubelio/domain/usecases/remove_cart_product.dart';
import 'package:jubelio/domain/usecases/insert_cart_product.dart';
import 'package:jubelio/domain/usecases/update_cart_product.dart';

part 'manage_cart_event.dart';
part 'manage_cart_state.dart';

class ManageCartBloc extends Bloc<ManageCartEvent, ManageCartState> {
  final InsertCartProduct insertCartProduct;
  final RemoveCartProduct removeCartProduct;
  final UpdateCartProduct updateCartProduct;

  ManageCartBloc(
      {required this.insertCartProduct,
      required this.removeCartProduct,
      required this.updateCartProduct})
      : super(ManageCartInitial()) {
    on<SaveCartProductEvent>(_onSaveProduct);
    on<AddQuantityProductEvent>(_onAddQuantityProduct);
    on<ReduceQuantityProductEvent>(_onReduceQuantityProduct);
    on<RemoveCartProductEvent>(_onRemoveProduct);
  }

  void _onSaveProduct(
      SaveCartProductEvent event, Emitter<ManageCartState> emit) async {
    emit(ManageCartLoading());
    final result = await insertCartProduct.execute(event.product);
    result.fold(
      (failure) {
        log(failure.message);
        emit(const ManageCartError('Failed to save Product to cart'));
      },
      (data) {
        emit(ManageCartSuccess(data));
      },
    );
  }

  void _onAddQuantityProduct(
      AddQuantityProductEvent event, Emitter<ManageCartState> emit) async {
    emit(ManageCartLoading());
    int quantity = event.cart.quantity! + 1;

    final result = await updateCartProduct.execute(event.cart, quantity);
    result.fold(
      (failure) {
        log(failure.message);
        emit(const ManageCartError('Add quantity failed'));
      },
      (data) async {
        emit(ManageCartSuccess(data));
      },
    );
  }

  void _onReduceQuantityProduct(
      ReduceQuantityProductEvent event, Emitter<ManageCartState> emit) async {
    if (event.cart.quantity != 1) {
      int quantity = event.cart.quantity! - 1;
      final result = await updateCartProduct.execute(event.cart, quantity);
      result.fold(
        (failure) {
          log(failure.message);
          emit(const ManageCartError('Reduce quantity failed'));
        },
        (data) async {
          emit(ManageCartSuccess(data));
        },
      );
    } else {
      log('Cannot reduce quantity');
    }
  }

  void _onRemoveProduct(
      RemoveCartProductEvent event, Emitter<ManageCartState> emit) async {
    final result = await removeCartProduct.execute(event.cart);
    result.fold(
      (failure) {
        log(failure.message);
        emit(const ManageCartError('Failed to remove Product from cart'));
      },
      (data) async {
        emit(ManageCartSuccess(data));
      },
    );
  }
}
