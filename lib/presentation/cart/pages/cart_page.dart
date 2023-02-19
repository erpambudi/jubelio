import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jubelio/common/constants/app_images.dart';
import 'package:jubelio/common/constants/app_values.dart';
import 'package:jubelio/common/styles/app_colors.dart';
import 'package:jubelio/presentation/cart/bloc/cart_bloc.dart';
import 'package:jubelio/presentation/cart/widgets/cart_tile.dart';
import 'package:jubelio/presentation/main/widgets/result_state_view.dart';
import 'package:jubelio/presentation/product/pages/product_detail_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartBloc>(context).add(GetCartsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<CartBloc>(context).add(GetCartsEvent());
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartStateLoaded) {
              var products = state.carts;

              if (products.isEmpty) {
                return const ResultStateView(
                  AppImages.emptyData,
                  "Empty Cart",
                );
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppValues.padding,
                      ),
                      itemCount: state.carts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.goNamed(ProductDetailPage.routeName,
                                extra: products[index].idProduct);
                          },
                          child: CartTile(products[index]),
                        );
                      },
                    ),
                  ),
                  priceView(state),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget priceView(CartStateLoaded state) {
    return Container(
      margin: const EdgeInsets.all(AppValues.margin),
      padding: const EdgeInsets.all(AppValues.margin_12),
      decoration: BoxDecoration(
        color: AppColors.brand,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Total Items : ",
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              Expanded(
                child: Text(
                  state.totalItems.toString(),
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppValues.margin_6,
          ),
          Container(
            height: 1.5,
            color: AppColors.white,
          ),
          const SizedBox(
            height: AppValues.margin_6,
          ),
          Row(
            children: [
              const Text(
                "Price Total : ",
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              Expanded(
                child: Text(
                  "Rp. ${state.totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
