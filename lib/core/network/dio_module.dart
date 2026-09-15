import 'package:digitera_task1/core/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
class DioModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: true,
      ),
    );

    return dio;
  }
}
