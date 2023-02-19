import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jubelio/core/flavors/build_config.dart';
import 'package:jubelio/core/flavors/environment.dart';
import 'package:jubelio/core/network/helpers/request_headers.dart';

class DioProvider {
  static final String baseUrl = BuildConfig.instance.config.baseUrl;

  static Dio? _instance;

  static final _prettyDioLogger =
      BuildConfig.instance.environment == Environment.development
          ? LogInterceptor(
              request: true,
              requestBody: false,
              requestHeader: false,
              responseBody: false,
              responseHeader: false,
              logPrint: (object) => log(object.toString()),
            )
          : const Interceptor();

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    } else {
      _instance!.interceptors.clear();
      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    }
  }

  static Dio get tokenClient {
    _addInterceptors();

    return _instance!;
  }

  static Dio get dioWithHeader {
    _addInterceptors();

    return _instance!;
  }

  static _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(RequestHeaderInterceptor());
    _instance!.interceptors.add(_prettyDioLogger);
  }

  static String _buildContentType(String version) {
    return "user_defined_content_type+$version";
  }

  DioProvider.setContentType(String version) {
    _instance?.options.contentType = _buildContentType(version);
  }

  DioProvider.setContentTypeApplicationJson() {
    _instance?.options.contentType = "application/json";
  }
}
