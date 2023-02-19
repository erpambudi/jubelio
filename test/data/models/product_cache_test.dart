import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/data/models/product_cache.dart';
import 'package:jubelio/domain/entities/product_cache.dart';

void main() {
  const tProductCacheModel = ProductCacheModel(
    id: 1,
    name: "Test",
    price: "12.9",
    image: "Test",
  );

  const tProductCache = ProductCache(
    id: 1,
    name: "Test",
    price: "12.9",
    image: "Test",
  );

  test('should be a subclass of Cache entity', () {
    final result = tProductCacheModel.toEntity();
    expect(result, tProductCache);
  });
}
