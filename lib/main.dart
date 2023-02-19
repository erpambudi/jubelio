import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jubelio/common/styles/app_theme.dart';
import 'package:jubelio/core/routes/routes_config.dart';
import 'package:jubelio/presentation/cart/bloc/cart_bloc.dart';
import 'package:jubelio/presentation/cart/bloc/manage_cart_bloc.dart';
import 'package:jubelio/presentation/product/bloc/cache_products_bloc.dart';

import 'core/flavors/environment.dart';
import 'injection.dart' as di;
import 'presentation/product/bloc/product_detail_bloc.dart';
import 'presentation/product/bloc/products_bloc.dart';

void main() {
  di.init();

  env(Environment.production);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<ProductsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ProductDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<CartBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ManageCartBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<CacheProductsBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Jubelio',
        theme: AppTheme.light(),
        routerConfig: router,
      ),
    );
  }
}
