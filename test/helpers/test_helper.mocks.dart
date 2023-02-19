// Mocks generated by Mockito 5.3.2 from annotations
// in jubelio/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:jubelio/core/network/failure.dart' as _i6;
import 'package:jubelio/data/datasources/local/database_helper.dart' as _i13;
import 'package:jubelio/data/datasources/local/product_local.dart' as _i10;
import 'package:jubelio/data/datasources/remote/product_remote.dart' as _i9;
import 'package:jubelio/data/models/cart_table.dart' as _i11;
import 'package:jubelio/data/models/product.dart' as _i3;
import 'package:jubelio/data/models/product_cache.dart' as _i12;
import 'package:jubelio/domain/entities/cart.dart' as _i16;
import 'package:jubelio/domain/entities/product.dart' as _i7;
import 'package:jubelio/domain/entities/product_cache.dart' as _i8;
import 'package:jubelio/domain/repositories/cart_repository.dart' as _i15;
import 'package:jubelio/domain/repositories/product_repository.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i14;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductModel_1 extends _i1.SmartFake implements _i3.ProductModel {
  _FakeProductModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i4.ProductRepository {
  MockProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Product>>> getProducts(
    int? page,
    int? perPage,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [
            page,
            perPage,
          ],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i7.Product>>>.value(
                _FakeEither_0<_i6.Failure, List<_i7.Product>>(
          this,
          Invocation.method(
            #getProducts,
            [
              page,
              perPage,
            ],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.Product>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.Product>> getProductDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductDetail,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.Product>>.value(
            _FakeEither_0<_i6.Failure, _i7.Product>(
          this,
          Invocation.method(
            #getProductDetail,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.Product>>);
  @override
  _i5.Future<
      _i2
          .Either<_i6.Failure, List<_i8.ProductCache>>> getProductsCache() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductsCache,
          [],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i8.ProductCache>>>.value(
                _FakeEither_0<_i6.Failure, List<_i8.ProductCache>>(
          this,
          Invocation.method(
            #getProductsCache,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i8.ProductCache>>>);
}

/// A class which mocks [ProductRemote].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRemote extends _i1.Mock implements _i9.ProductRemote {
  MockProductRemote() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i3.ProductModel>> getProducts(
    int? page,
    int? perPage,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [
            page,
            perPage,
          ],
        ),
        returnValue:
            _i5.Future<List<_i3.ProductModel>>.value(<_i3.ProductModel>[]),
      ) as _i5.Future<List<_i3.ProductModel>>);
  @override
  _i5.Future<_i3.ProductModel> getProductDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getProductDetail,
          [id],
        ),
        returnValue: _i5.Future<_i3.ProductModel>.value(_FakeProductModel_1(
          this,
          Invocation.method(
            #getProductDetail,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.ProductModel>);
}

/// A class which mocks [ProductLocal].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductLocal extends _i1.Mock implements _i10.ProductLocal {
  MockProductLocal() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> insertProduct(_i11.CartTable? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProduct,
          [product],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<String> removeProduct(_i11.CartTable? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeProduct,
          [product],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<_i11.CartTable?> getProductById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getProductById,
          [id],
        ),
        returnValue: _i5.Future<_i11.CartTable?>.value(),
      ) as _i5.Future<_i11.CartTable?>);
  @override
  _i5.Future<List<_i11.CartTable>> getCartData() => (super.noSuchMethod(
        Invocation.method(
          #getCartData,
          [],
        ),
        returnValue: _i5.Future<List<_i11.CartTable>>.value(<_i11.CartTable>[]),
      ) as _i5.Future<List<_i11.CartTable>>);
  @override
  _i5.Future<String> updateQuantity(
    _i11.CartTable? product,
    int? quantity,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateQuantity,
          [
            product,
            quantity,
          ],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<void> cacheProducts(List<_i12.ProductCacheModel>? products) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheProducts,
          [products],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<List<_i12.ProductCacheModel>> getCachedProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedProducts,
          [],
        ),
        returnValue: _i5.Future<List<_i12.ProductCacheModel>>.value(
            <_i12.ProductCacheModel>[]),
      ) as _i5.Future<List<_i12.ProductCacheModel>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i13.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i14.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i5.Future<_i14.Database?>.value(),
      ) as _i5.Future<_i14.Database?>);
  @override
  _i5.Future<int> insertCartTable(_i11.CartTable? cartTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertCartTable,
          [cartTable],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);
  @override
  _i5.Future<int> removeCartTable(_i11.CartTable? cartTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeCartTable,
          [cartTable],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);
  @override
  _i5.Future<int> updateQty(
    _i11.CartTable? cartTable,
    int? quantity,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateQty,
          [
            cartTable,
            quantity,
          ],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);
  @override
  _i5.Future<Map<String, dynamic>?> getCartTableById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCartTableById,
          [id],
        ),
        returnValue: _i5.Future<Map<String, dynamic>?>.value(),
      ) as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getCartData() => (super.noSuchMethod(
        Invocation.method(
          #getCartData,
          [],
        ),
        returnValue: _i5.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<void> insertProductCache(List<_i12.ProductCacheModel>? products) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProductCache,
          [products],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getCacheProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCacheProducts,
          [],
        ),
        returnValue: _i5.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<int> clearProductCache() => (super.noSuchMethod(
        Invocation.method(
          #clearProductCache,
          [],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);
}

/// A class which mocks [CartRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartRepository extends _i1.Mock implements _i15.CartRepository {
  MockCartRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i16.Cart>>> getCartData() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCartData,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i16.Cart>>>.value(
            _FakeEither_0<_i6.Failure, List<_i16.Cart>>(
          this,
          Invocation.method(
            #getCartData,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i16.Cart>>>);
  @override
  _i5.Future<_i16.Cart?> isAddedToCart(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToCart,
          [id],
        ),
        returnValue: _i5.Future<_i16.Cart?>.value(),
      ) as _i5.Future<_i16.Cart?>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> insertProduct(_i16.Cart? cart) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProduct,
          [cart],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #insertProduct,
            [cart],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> removeProduct(_i16.Cart? cart) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeProduct,
          [cart],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #removeProduct,
            [cart],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> updateQuantity(
    _i16.Cart? cart,
    int? quantity,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateQuantity,
          [
            cart,
            quantity,
          ],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #updateQuantity,
            [
              cart,
              quantity,
            ],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);
}
