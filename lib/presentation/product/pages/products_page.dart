import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jubelio/common/constants/app_images.dart';
import 'package:jubelio/common/constants/app_values.dart';
import 'package:jubelio/common/styles/app_colors.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/presentation/main/widgets/app_dialog.dart';
import 'package:jubelio/presentation/main/widgets/result_state_view.dart';
import 'package:jubelio/presentation/product/bloc/cache_products_bloc.dart';
import 'package:jubelio/presentation/product/bloc/products_bloc.dart';
import 'package:jubelio/presentation/product/pages/product_detail_page.dart';
import 'package:jubelio/presentation/product/pages/search_product_page.dart';
import 'package:jubelio/presentation/product/widgets/product_shimmer.dart';
import 'package:jubelio/presentation/product/widgets/product_tile.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final PagingController<int, Product> pagingController =
      PagingController(firstPageKey: 1);

  final int pageSize = 5;

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      context
          .read<ProductsBloc>()
          .add(GetProductsEvent(page: pageKey, perPage: pageSize));
    });
  }

  @override
  void dispose() {
    super.dispose();
    pagingController.dispose();
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppValues.padding,
        AppValues.extraLargePadding,
        AppValues.padding,
        AppValues.paddingZero,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Wrap(
              children: const [
                Text(
                  "Find",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Your Best Products",
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.brand,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: CircleAvatar(
              backgroundColor: AppColors.grey,
              child: Image.asset(AppImages.malePerson),
            ),
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return GestureDetector(
      onTap: () {
        context.goNamed(SearchProductPage.routeName,
            extra: pagingController.itemList ?? <Product>[]);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(
          AppValues.padding_12,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: AppValues.margin,
        ),
        decoration: BoxDecoration(
          color: AppColors.fill,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: const [
            Expanded(
              child: Text(
                "Search Product...",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Icon(
              Icons.search,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget products() {
    return PagedSliverList<int, Product>(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<Product>(
        animateTransitions: true,
        itemBuilder: (context, item, index) {
          return GestureDetector(
            onTap: () async {
              context.goNamed(ProductDetailPage.routeName, extra: item.id);
            },
            child: Container(
              margin: EdgeInsets.only(
                top: item == pagingController.itemList?.first
                    ? AppValues.margin
                    : 0,
                bottom: item == pagingController.itemList?.last
                    ? AppValues.margin
                    : AppValues.margin_12,
              ),
              child: ProductTile(
                product: item,
              ),
            ),
          );
        },
        firstPageProgressIndicatorBuilder: (context) {
          return const ProductShimmer();
        },
        noItemsFoundIndicatorBuilder: (context) {
          return const ResultStateView(
            AppImages.emptyData,
            "Oppss.. No Data Found",
          );
        },
        firstPageErrorIndicatorBuilder: (context) {
          return BlocBuilder<CacheProductsBloc, CacheProductsState>(
            builder: (context, state) {
              if (state is CacheProductsHasData) {
                var products = state.products;

                return Column(
                  children: List.generate(
                    products.length,
                    (index) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: index == 0 ? AppValues.margin : 0,
                          bottom: index == products.length - 1
                              ? AppValues.margin
                              : AppValues.margin_12,
                        ),
                        child: ProductCacheTile(product: products[index]),
                      );
                    },
                  ),
                );
              }

              return Container();
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => pagingController.refresh(),
        ),
        child: BlocListener<ProductsBloc, ProductsState>(
          listener: (context, state) {
            if (state is ProductsHasData) {
              bool isLastPage = state.products.length < pageSize;

              if (isLastPage) {
                pagingController.appendLastPage(state.products);
              } else {
                pagingController.appendPage(
                    state.products, state.currentPage + 1);
              }
            }

            if (state is ProductsError) {
              context.read<CacheProductsBloc>().add(GetCacheProductsEvent());
              pagingController.error = state.message;
              AppDialog.showMainSnackbar(context, state.message);
            }
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: false,
                centerTitle: false,
                toolbarHeight: 90,
                elevation: 0,
                titleSpacing: 0,
                backgroundColor: Colors.white,
                title: header(),
                bottom: AppBar(
                  elevation: 0,
                  titleSpacing: 0,
                  toolbarHeight: 86,
                  backgroundColor: Colors.white,
                  title: searchBar(),
                ),
              ),
              products(),
            ],
          ),
        ),
      ),
    );
  }
}
