import 'package:equatable/equatable.dart';
import 'package:jubelio/domain/entities/product_cache.dart';

class ProductCacheModel extends Equatable {
  final int id;
  final String name;
  final String price;
  final String image;

  const ProductCacheModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory ProductCacheModel.fromJson(Map<String, dynamic> json) =>
      ProductCacheModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
      };

  ProductCache toEntity() => ProductCache(
        id: id,
        name: name,
        price: price,
        image: image,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        image,
      ];
}
