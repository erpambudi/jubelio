import 'package:jubelio/common/constants/app_key.dart';
import 'package:jubelio/core/network/helpers/base_remote_source.dart';
import 'package:jubelio/core/network/helpers/dio_provider.dart';
import 'package:jubelio/data/models/product.dart';

abstract class ProductRemote {
  Future<List<ProductModel>> getProducts(int page, int perPage);
  Future<ProductModel> getProductDetail(int id);
}

class ProductRemoteImpl extends BaseRemoteSource implements ProductRemote {
  @override
  Future<List<ProductModel>> getProducts(int page, int perPage) {
    try {
      final dioCall = dioClient.get(
        "${DioProvider.baseUrl}/products",
        queryParameters: {
          "consumer_key": AppKey.consumerKey,
          "consumer_secret": AppKey.consumerSecret,
          "page": page,
          "per_page": perPage,
        },
      );

      return callApiWithErrorParser(dioCall).then((response) {
        final products = response.data as List;
        return products.map((e) => ProductModel.fromJson(e)).toList();
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductModel> getProductDetail(int id) {
    try {
      final dioCall = dioClient.get(
        "${DioProvider.baseUrl}/products/$id",
        queryParameters: {
          "consumer_key": AppKey.consumerKey,
          "consumer_secret": AppKey.consumerSecret,
        },
      );

      return callApiWithErrorParser(dioCall).then((response) {
        return ProductModel.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
