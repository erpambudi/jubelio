import 'package:jubelio/data/datasources/local/database_helper.dart';
import 'package:jubelio/data/datasources/local/product_local.dart';
import 'package:jubelio/data/datasources/remote/product_remote.dart';
import 'package:jubelio/domain/repositories/cart_repository.dart';
import 'package:jubelio/domain/repositories/product_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    ProductRepository,
    ProductRemote,
    ProductLocal,
    DatabaseHelper,
    CartRepository
  ],
)
void main() {}
