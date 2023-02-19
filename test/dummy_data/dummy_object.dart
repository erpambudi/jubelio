import 'package:jubelio/data/models/cart_table.dart';
import 'package:jubelio/data/models/product_cache.dart';
import 'package:jubelio/domain/entities/cart.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/domain/entities/product_cache.dart';

// Product
const testProduct = Product(
  id: 186,
  name: "Divi Ninja Tee",
  price: "12.99",
  shortDescription:
      "<p>This comfortable cotton t-shirt features the Divi logo on the front and expresses your Ninja status with the theme. It is the perfect tee for any occasion.</p>\n",
);

final testProductsList = [testProduct];

// Cache
const testCacheProduct = ProductCache(
  id: 186,
  name: "Divi Ninja Tee",
  price: "12.99",
  image:
      "https://codetesting.jubelio.store/wp-content/uploads/2022/11/Divi-Ninja.jpg",
);

final testCacheProductList = [testCacheProduct];

const testCacheProductModel = ProductCacheModel(
  id: 186,
  name: "Divi Ninja Tee",
  price: "12.99",
  image:
      "https://codetesting.jubelio.store/wp-content/uploads/2022/11/Divi-Ninja.jpg",
);

final testCacheProductMap = {
  "id": 186,
  "name": "Divi Ninja Tee",
  "price": "12.99",
  "image":
      "https://codetesting.jubelio.store/wp-content/uploads/2022/11/Divi-Ninja.jpg",
};

// Cart
final testCartProduct = Cart(
  id: 1,
  idProduct: 186,
  name: "Divi Ninja Tee",
  price: "12.99",
  quantity: 1,
  image:
      "https://codetesting.jubelio.store/wp-content/uploads/2022/11/Divi-Ninja.jpg",
  brand: "Divi",
  size: "Large",
);

final testCartQuantityProduct = Cart(
  id: 1,
  idProduct: 186,
  name: "Divi Ninja Tee",
  price: "12.99",
  quantity: 2,
  image:
      "https://codetesting.jubelio.store/wp-content/uploads/2022/11/Divi-Ninja.jpg",
  brand: "Divi",
  size: "Large",
);

final testCartProductList = [testCartProduct];

const testCartProductModel = CartTable(
  id: 1,
  idProduct: 186,
  name: "Divi Ninja Tee",
  price: "12.99",
  quantity: 1,
  image:
      "https://codetesting.jubelio.store/wp-content/uploads/2022/11/Divi-Ninja.jpg",
  brand: "Divi",
  size: "Large",
);

final testCartProductMap = {
  "id": 1,
  "idProduct": 186,
  "name": "Divi Ninja Tee",
  "price": "12.99",
  "quantity": 1,
  "image":
      "https://codetesting.jubelio.store/wp-content/uploads/2022/11/Divi-Ninja.jpg",
  "brand": "Divi",
  "size": "Large",
};
