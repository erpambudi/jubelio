import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jubelio/domain/entities/cart.dart';
import 'package:jubelio/domain/usecases/get_cart_products.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartProducts getCartProducts;

  CartBloc({required this.getCartProducts}) : super(CartStateInitial()) {
    on<GetCartsEvent>(_onGetCartsProduct);
  }

  void _onGetCartsProduct(GetCartsEvent event, Emitter<CartState> emit) async {
    final result = await getCartProducts.execute();
    result.fold(
      (failure) {
        emit(const CartStateError('Error while loading cart'));
      },
      (carts) {
        double totalPrice = 0;
        int totalItems = 0;

        for (final cart in carts) {
          totalPrice += double.parse(cart.price) * cart.quantity!;
          totalItems += cart.quantity!;
        }

        emit(CartStateLoaded(
            carts: carts, totalPrice: totalPrice, totalItems: totalItems));
      },
    );
  }
}
