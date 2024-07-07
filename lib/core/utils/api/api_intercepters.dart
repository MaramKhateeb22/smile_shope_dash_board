import 'package:dio/dio.dart';

class ApiIntercepter extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers[''] = 'ar';
    super.onRequest(options, handler);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    // print(err);

    super.onError(err, handler);
  }
}
