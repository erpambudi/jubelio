import 'package:get_it/get_it.dart';
import 'package:jubelio/data/datasources/local/product_local.dart';
import 'package:jubelio/domain/usecases/get_product_detail.dart';
import 'package:jubelio/domain/usecases/get_products_cached.dart';
import 'package:jubelio/presentation/cart/bloc/manage_cart_bloc.dart';
import 'package:jubelio/presentation/product/bloc/cache_products_bloc.dart';

import 'data/datasources/local/database_helper.dart';
import 'data/datasources/remote/product_remote.dart';
import 'data/repositories/cart_repository_impl.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/repositories/cart_repository.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/usecases/get_cart_products.dart';
import 'domain/usecases/get_products.dart';
import 'domain/usecases/remove_cart_product.dart';
import 'domain/usecases/insert_cart_product.dart';
import 'domain/usecases/update_cart_product.dart';
import 'presentation/cart/bloc/cart_bloc.dart';
import 'presentation/product/bloc/product_detail_bloc.dart';
import 'presentation/product/bloc/products_bloc.dart';

final locator = GetIt.instance;

void init() {
  //BLoC
  locator.registerFactory(() => ProductsBloc(locator()));
  locator.registerFactory(() => ProductDetailBloc(getProductDetail: locator()));
  locator.registerFactory(() => CartBloc(getCartProducts: locator()));
  locator.registerFactory(() => ManageCartBloc(
      insertCartProduct: locator(),
      removeCartProduct: locator(),
      updateCartProduct: locator()));
  locator
      .registerFactory(() => CacheProductsBloc(getProductsCached: locator()));

  //Use case
  locator.registerLazySingleton(() => GetProducts(locator()));
  locator.registerLazySingleton(() => GetProductDetail(locator()));
  locator.registerLazySingleton(() => GetCartProducts(locator()));
  locator.registerLazySingleton(() => InsertCartProduct(locator()));
  locator.registerLazySingleton(() => RemoveCartProduct(locator()));
  locator.registerLazySingleton(() => UpdateCartProduct(locator()));
  locator.registerLazySingleton(() => GetProductsCached(locator()));

  //Repository
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remote: locator(), local: locator()),
  );
  locator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(productLocal: locator()));

  //Data sources
  locator.registerLazySingleton<ProductRemote>(() => ProductRemoteImpl());
  locator.registerLazySingleton<ProductLocal>(
      () => ProductLocalImpl(databaseHelper: locator()));

  //Helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
}
