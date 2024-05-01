import 'package:dio/dio.dart';
import 'package:smile_shope_dash_board/core/errors/exception.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_consumer.dart';
import 'package:smile_shope_dash_board/core/utils/api/api_intercepters.dart';
import 'package:smile_shope_dash_board/core/utils/api/end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiIntercepter()); //intercepters مثل رجل المرور
    dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    ); //print response and request in consol
  }
  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? qureyparamer,
      bool isForm = false}) async {
    try {
      final response = await dio.delete(path,
          data: isForm ? FormData.fromMap(data) : data,
          queryParameters: qureyparamer);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? qureyparamer}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: qureyparamer);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? qureyparamer,
      bool isForm = false}) async {
    try {
      final response = await dio.patch(path,
          data: isForm ? FormData.fromMap(data) : data,
          queryParameters: qureyparamer);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? qureyparamer,
      bool isForm = false}) async {
    try {
      final response = await dio.post(path,
          data: isForm ? FormData.fromMap(data) : data,
          queryParameters: qureyparamer);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
