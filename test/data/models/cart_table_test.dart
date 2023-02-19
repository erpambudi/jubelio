import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/data/models/cart_table.dart';
import 'package:jubelio/domain/entities/cart.dart';

void main() {
  const tCartTable = CartTable(
    id: 1,
    idProduct: 186,
    name: "Divi Ninja Tee",
    price: "12.99",
    brand: "Divi",
    image:
        "https://jubelio.com/wp-content/uploads/2021/04/Divi-Ninja-Tee-1.jpg",
    quantity: 1,
    size: "Large",
  );

  var tCart = Cart(
    id: 1,
    idProduct: 186,
    name: "Divi Ninja Tee",
    price: "12.99",
    brand: "Divi",
    image:
        "https://jubelio.com/wp-content/uploads/2021/04/Divi-Ninja-Tee-1.jpg",
    quantity: 1,
    size: "Large",
  );

  test('should be a subclass of Cart entity', () {
    final result = tCartTable.toEntity();
    expect(result, tCart);
  });
}
