// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  Cart({
    this.id,
    required this.idProduct,
    required this.name,
    required this.price,
    this.quantity,
    this.image,
    this.size,
    this.brand,
  });

  int? id;
  final int idProduct;
  final String name;
  final String price;
  final String? image;
  int? quantity;
  String? size;
  String? brand;

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
