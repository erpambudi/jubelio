import 'package:equatable/equatable.dart';
import 'package:jubelio/domain/entities/cart.dart';

class CartTable extends Equatable {
  final int id;
  final int idProduct;
  final String name;
  final String price;
  final int? quantity;
  final String? image;
  final String? size;
  final String? brand;

  const CartTable({
    required this.id,
    required this.idProduct,
    required this.name,
    required this.price,
    this.quantity,
    this.image,
    this.size,
    this.brand,
  });

  factory CartTable.fromMap(Map<String, dynamic> map) {
    return CartTable(
      id: map['id'],
      idProduct: map['idProduct'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
      image: map['image'],
      size: map['size'],
      brand: map['brand'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idProduct': idProduct,
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
      'size': size,
      'brand': brand,
    };
  }

  Cart toEntity() => Cart(
        id: id,
        idProduct: idProduct,
        name: name,
        price: price,
        quantity: quantity,
        image: image,
        size: size,
        brand: brand,
      );

  factory CartTable.fromCartEntity(Cart cart) => CartTable(
        id: cart.id!,
        idProduct: cart.idProduct,
        name: cart.name,
        price: cart.price,
        quantity: cart.quantity!,
        image: cart.image,
        size: cart.size,
        brand: cart.brand,
      );

  @override
  List<Object?> get props => [
        id,
        idProduct,
        name,
        price,
        quantity,
        image,
        size,
        brand,
      ];
}
