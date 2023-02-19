import 'package:equatable/equatable.dart';

class ProductCache extends Equatable {
  final int id;
  final String name;
  final String price;
  final String image;

  const ProductCache({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, price, image];
}
