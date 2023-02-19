import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/presentation/main/pages/main_page.dart';
import 'package:jubelio/presentation/product/pages/product_detail_page.dart';
import 'package:jubelio/presentation/product/pages/search_product_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/main",
  routes: [
    GoRoute(
      path: "/main",
      name: MainPage.routeName,
      builder: (context, state) {
        return const MainPage();
      },
      routes: [
        GoRoute(
          path: "search-product",
          name: SearchProductPage.routeName,
          builder: (context, state) {
            var products = state.extra;
            return SearchProductPage(products: products as List<Product>);
          },
        ),
        GoRoute(
          path: "product-detail",
          name: ProductDetailPage.routeName,
          builder: (context, state) {
            var id = state.extra;
            return ProductDetailPage(id: id as int);
          },
        ),
      ],
    ),
  ],
  routerNeglect: true,
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text(
          "Error: ${state.error}",
          textAlign: TextAlign.center,
        ),
      ),
    );
  },
);
