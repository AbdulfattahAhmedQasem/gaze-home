import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gazhome/core/services/env_service.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  const DioFactory._();

  static Future<Dio> getDio() async {
    final dio =
        Dio()
          ..options = BaseOptions(
            baseUrl: EnvService.baseUrl,
            connectTimeout: AppFunctions.duration1m,
            sendTimeout: AppFunctions.duration1m,
            receiveTimeout: AppFunctions.duration1m,
          );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }
}
