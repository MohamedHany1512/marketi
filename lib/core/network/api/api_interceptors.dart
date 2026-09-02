import 'package:dio/dio.dart';
import 'package:marketi/core/helper/cache_helper.dart';
import 'package:marketi/core/network/api/end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final token = CacheHelper().getData(
      key: ApiKey.token,
    );

    if (token != null && token.toString().isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}