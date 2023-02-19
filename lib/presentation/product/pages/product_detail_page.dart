import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:jubelio/common/constants/app_images.dart';
import 'package:jubelio/common/constants/app_values.dart';
import 'package:jubelio/common/styles/app_colors.dart';
import 'package:jubelio/common/styles/app_text_styles.dart';
import 'package:jubelio/domain/entities/cart.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/domain/entities/product_properties.dart';
import 'package:jubelio/presentation/cart/bloc/cart_bloc.dart';
import 'package:jubelio/presentation/cart/bloc/manage_cart_bloc.dart';
import 'package:jubelio/presentation/main/widgets/app_dialog.dart';
import 'package:jubelio/presentation/main/widgets/app_image_network.dart';
import 'package:jubelio/presentation/main/widgets/result_state_view.dart';
import 'package:jubelio/presentation/product/bloc/product_detail_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  static const routeName = "/product-detail";

  final int id;

  const ProductDetailPage({required this.id, super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> categories = [];
  List<String> brands = [];
  List<String> sizes = [];

  Widget header(Product product) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final scrolled = constraints.scrollOffset > 0;
        return SliverAppBar(
          pinned: true,
          backgroundColor: AppColors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          expandedHeight: 300,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: scrolled ? AppColors.black : AppColors.white,
            ),
            onTap: () {
              context.pop();
            },
          ),
          title: Text(
            scrolled ? product.name! : '',
            style: AppTextStyle.appBarTitle.copyWith(
              color: AppColors.black,
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: SizedBox(
              height: 300,
              child: product.images!.isNotEmpty
                  ? AppImageNetwork(
                      product.images!.first.src ?? "",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppImages.emptyImage,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget contents(Product product) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppValues.padding,
          vertical: AppValues.largePadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name ?? "",
              style: AppTextStyle.title.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: AppValues.smallMargin,
            ),
            Text(
              "Rp. ${product.price!.isEmpty ? "0" : product.price!}",
              style: AppTextStyle.brand.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: AppValues.margin_18,
            ),
            Text(
              "Additional information",
              style: AppTextStyle.title,
            ),
            const SizedBox(
              height: AppValues.smallMargin,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                AppValues.padding,
                AppValues.padding,
                AppValues.padding,
                AppValues.halfPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.borderColor,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  categories.isNotEmpty
                      ? informationItem("Categories", categories)
                      : Container(),
                  brands.isNotEmpty
                      ? informationItem("Brand", brands)
                      : Container(),
                  sizes.isNotEmpty
                      ? informationItem("Sizes", sizes)
                      : Container(),
                ],
              ),
            ),
            const SizedBox(
              height: AppValues.margin_18,
            ),
            Text(
              "Description",
              style: AppTextStyle.title,
            ),
            const SizedBox(
              height: AppValues.smallMargin,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppValues.padding),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.borderColor,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: HtmlWidget(
                product.shortDescription ?? "",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget informationItem(String title, List<String> items) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: AppValues.padding_4,
      ),
      margin: const EdgeInsets.only(
        bottom: AppValues.halfPadding,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const Text(
            ":",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            width: AppValues.margin_10,
          ),
          Expanded(
            child: Wrap(
              children: List.generate(
                items.length,
                (i) => Text(
                  items[i] + (items[i] == items.last ? "" : ", "),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonAddToCart(Product product) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.fromLTRB(
          AppValues.margin,
          AppValues.marginZero,
          AppValues.margin,
          AppValues.margin_30,
        ),
        width: double.infinity,
        height: 50,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                if (state is CartStateLoaded) {
                  onAddCart(product, state.carts);
                }
              },
              child: state is CartStateLoaded
                  ? const Text("Add to cart")
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget varianItem(String? selected, String item) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppValues.padding_12,
        vertical: AppValues.halfPadding,
      ),
      decoration: BoxDecoration(
        color: selected == item ? AppColors.brand : Colors.white,
        border: Border.all(
          color: AppColors.brand,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Text(
        item,
        style: TextStyle(
          color: selected == item ? Colors.white : AppColors.brand,
        ),
      ),
    );
  }

  void onAddCart(Product product, List<Cart> carts) async {
    String? selectedSize;
    String? selectedBrand;

    Cart productToCart = Cart(
      id: DateTime.now().millisecondsSinceEpoch,
      idProduct: product.id ?? 0,
      name: product.name ?? "-",
      quantity: 1,
      price: product.price != null && product.price!.isNotEmpty
          ? product.price!
          : "0.0",
      image: product.images != null && product.images!.isNotEmpty
          ? product.images!.first.src
          : null,
    );

    Cart findItemOnCart() {
      Cart cart = carts.firstWhere(
        (element) =>
            element.idProduct == product.id &&
            element.size == selectedSize &&
            element.brand == selectedBrand,
        orElse: () => Cart(
          idProduct: 0,
          name: "",
          price: "",
        ),
      );
      return cart;
    }

    if (brands.isEmpty && sizes.isEmpty) {
      Cart cart = findItemOnCart();

      if (cart.idProduct != 0) {
        productToCart.id = cart.id;
        productToCart.quantity = cart.quantity;
        context
            .read<ManageCartBloc>()
            .add(AddQuantityProductEvent(productToCart));
      } else {
        context.read<ManageCartBloc>().add(SaveCartProductEvent(productToCart));
      }
      return;
    }

    if (brands.isNotEmpty) {
      selectedBrand = brands.first;
    }

    if (sizes.isNotEmpty) {
      selectedSize = sizes.first;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(
                    AppValues.padding,
                  ),
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: product.images != null &&
                                  product.images!.isNotEmpty
                              ? AppImageNetwork(
                                  product.images![0].src!,
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
                          width: AppValues.margin_10,
                        ),
                        Expanded(
                          child: Text(
                            product.name ?? "",
                            style: AppTextStyle.title,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppValues.margin,
                    ),
                    sizes.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sizes",
                                style: AppTextStyle.title,
                              ),
                              const SizedBox(
                                height: AppValues.margin_10,
                              ),
                              StatefulBuilder(builder: (context, setState) {
                                return Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: sizes
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            if (selectedSize != e) {
                                              setState(() {
                                                selectedSize = e;
                                              });
                                            }
                                          },
                                          child: varianItem(selectedSize, e),
                                        ),
                                      )
                                      .toList(),
                                );
                              }),
                            ],
                          )
                        : Container(),
                    const SizedBox(
                      height: AppValues.margin_18,
                    ),
                    brands.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Brands",
                                style: AppTextStyle.title,
                              ),
                              const SizedBox(
                                height: AppValues.margin_10,
                              ),
                              StatefulBuilder(builder: (context, setState) {
                                return Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: brands
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            if (selectedBrand != e) {
                                              setState(() {
                                                selectedBrand = e;
                                              });
                                            }
                                          },
                                          child: varianItem(selectedBrand, e),
                                        ),
                                      )
                                      .toList(),
                                );
                              }),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(AppValues.margin),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Cart cart = findItemOnCart();

                    productToCart.size = selectedSize;
                    productToCart.brand = selectedBrand;

                    if (cart.idProduct != 0) {
                      productToCart.id = cart.id;
                      productToCart.quantity = cart.quantity;
                      context
                          .read<ManageCartBloc>()
                          .add(AddQuantityProductEvent(productToCart));
                    } else {
                      context
                          .read<ManageCartBloc>()
                          .add(SaveCartProductEvent(productToCart));
                    }

                    context.pop();
                  },
                  child: const Text("Add to cart"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void initialVarian(Product product) {
    categories = product.categories!.map((e) => e.name ?? "").toList();

    if (product.attributes != null && product.attributes!.isNotEmpty) {
      Attribute? brand = product.attributes!.firstWhere(
        (element) => element.name == "Brand",
        orElse: () => const Attribute(name: "", options: []),
      );

      Attribute? size = product.attributes!.firstWhere(
          (element) => element.name == "Size",
          orElse: () => const Attribute(name: "", options: []));

      brands = brand.options!.isNotEmpty ? brand.options! : [];
      sizes = size.options!.isNotEmpty ? size.options! : [];
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ProductDetailBloc>().add(GetProductDetailEvent(widget.id));
  }

  @override
  void dispose() {
    categories.clear();
    brands.clear();
    sizes.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ManageCartBloc, ManageCartState>(
        listener: (context, state) {
          if (state is ManageCartSuccess) {
            context.read<CartBloc>().add(GetCartsEvent());
            AppDialog.showMainSnackbar(
              context,
              state.message,
              isSuccess: true,
            );
          }

          if (state is ManageCartError) {
            AppDialog.showMainSnackbar(
              context,
              state.message,
              isError: true,
            );
          }
        },
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state is ProductDetailHasData) {
              var product = state.product;
              initialVarian(product);

              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  header(product),
                  contents(product),
                  buttonAddToCart(product),
                ],
              );
            }

            if (state is ProductDetailError) {
              return Center(
                child: ResultStateView(
                  AppImages.errorData,
                  state.message,
                ),
              );
            }

            return const Center(
              key: Key('error_message'),
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
