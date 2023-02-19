import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:jubelio/common/constants/app_images.dart";
import "package:jubelio/common/constants/app_values.dart";
import "package:jubelio/common/styles/app_colors.dart";
import "package:jubelio/common/styles/app_text_styles.dart";
import "package:jubelio/domain/entities/cart.dart";
import "package:jubelio/presentation/cart/bloc/cart_bloc.dart";
import "package:jubelio/presentation/cart/bloc/manage_cart_bloc.dart";
import "package:jubelio/presentation/main/widgets/app_dialog.dart";
import "package:jubelio/presentation/main/widgets/app_image_network.dart";

class CartTile extends StatefulWidget {
  final Cart cart;

  const CartTile(this.cart, {super.key});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  int? quantity;

  _onAddQuantity() {
    context.read<ManageCartBloc>().add(AddQuantityProductEvent(widget.cart));
    context.read<CartBloc>().add(GetCartsEvent());
  }

  _onReduceQuantity() {
    if (quantity != 1) {
      context
          .read<ManageCartBloc>()
          .add(ReduceQuantityProductEvent(widget.cart));
      context.read<CartBloc>().add(GetCartsEvent());
    } else {
      _onRemoveItem();
    }
  }

  _onRemoveItem() {
    AppDialog.showAlertDialog(
      context,
      "Remove ${widget.cart.name}",
      "Are you sure you want to remove ${widget.cart.name} from cart?",
      positiveButtonText: "Remove",
      positiveButtonCallback: () {
        context.read<ManageCartBloc>().add(RemoveCartProductEvent(widget.cart));
        context.read<CartBloc>().add(GetCartsEvent());
      },
      negativeButtonText: "Cancel",
    );
  }

  Widget _quantityBox() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartStateLoaded) {
          quantity = state.carts
              .firstWhere((cart) => cart.id == widget.cart.id)
              .quantity;
        }
        return Text(
          (quantity != null) ? "$quantity" : "-",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(
        AppValues.padding,
      ),
      margin: const EdgeInsets.fromLTRB(
        AppValues.margin,
        AppValues.marginZero,
        AppValues.margin,
        AppValues.margin_12,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppValues.radius,
          ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: widget.cart.image != null
                ? AppImageNetwork(
                    widget.cart.image!,
                    height: 74,
                    width: 74,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    AppImages.emptyImage,
                    height: 74,
                    width: 74,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: AppValues.smallMargin,
                    bottom: AppValues.margin_4,
                  ),
                  child: Text(
                    widget.cart.name,
                    style: AppTextStyle.main,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${widget.cart.brand != null ? "${widget.cart.brand!} ${widget.cart.size != null ? "-" : ""}" : ""}  ${widget.cart.size != null ? widget.cart.size! : ""}",
                  style: AppTextStyle.main.copyWith(
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Price : ",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Rp ${widget.cart.price}",
                                    style: AppTextStyle.brand.copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Sub total : ",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Expanded(
                                  child: Builder(builder: (context) {
                                    var subTotal =
                                        (num.parse(widget.cart.price) *
                                            (widget.cart.quantity ?? 0));

                                    String subTotalString = subTotal is double
                                        ? subTotal.toStringAsFixed(2)
                                        : subTotal.toString();

                                    return Text(
                                      "Rp $subTotalString",
                                      style: AppTextStyle.brand.copyWith(
                                        fontSize: 12,
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(
                          AppValues.halfPadding,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: _onReduceQuantity,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: AppValues.smallMargin,
                                ),
                                padding: const EdgeInsets.all(
                                  AppValues.padding_3,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(
                                    AppValues.radius_6,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            _quantityBox(),
                            InkWell(
                              onTap: _onAddQuantity,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: AppValues.smallMargin,
                                ),
                                padding: const EdgeInsets.all(
                                  AppValues.padding_3,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.brand,
                                  borderRadius: BorderRadius.circular(
                                    AppValues.radius_6,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 15,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
