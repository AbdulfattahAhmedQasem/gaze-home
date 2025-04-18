import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/errors/app_failure.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/networking/api_constants.dart';
import 'package:gazhome/core/networking/network_info.dart';
import 'package:gazhome/core/services/env_service.dart';
import 'package:gazhome/core/utilities/app_result.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';

enum RequestType { get, post, put, delete }

class ApiService {
  ApiService({required Dio dio, required NetworkInfo networkInfo})
      : _dio = dio,
        _networkInfo = networkInfo;

  final Dio _dio;
  final NetworkInfo _networkInfo;

  Future<DataMap> get(
    String path, {
    String? baseUrl,
    dynamic body,
    DataMap? queryParameters,
    Map<String, String>? headers,
  }) {
    return _performRequest(
      path: path,
      baseUrl: baseUrl,
      body: body,
      queryParameters: queryParameters,
      headers: headers,
      type: RequestType.get,
    );
  }

  Future<DataMap> post(
    String path, {
    String? baseUrl,
    dynamic body,
    DataMap? queryParameters,
    Map<String, String>? headers,
  }) async {
    return _performRequest(
      path: path,
      baseUrl: baseUrl,
      body: body,
      queryParameters: queryParameters,
      headers: headers,
      type: RequestType.post,
    );
  }

  Future<DataMap> put(
    String path, {
    String? baseUrl,
    dynamic body,
    DataMap? queryParameters,
    Map<String, String>? headers,
  }) async {
    return _performRequest(
      path: path,
      baseUrl: baseUrl,
      body: body,
      queryParameters: queryParameters,
      headers: headers,
      type: RequestType.put,
    );
  }

  Future<DataMap> delete(
    String path, {
    String? baseUrl,
    dynamic body,
    DataMap? queryParameters,
    Map<String, String>? headers,
  }) async {
    return _performRequest(
      path: path,
      baseUrl: baseUrl,
      body: body,
      queryParameters: queryParameters,
      headers: headers,
      type: RequestType.delete,
    );
  }

  Future<DataMap> _performRequest({
    required String path,
    required String? baseUrl,
    required dynamic body,
    required DataMap? queryParameters,
    required Map<String, String>? headers,
    required RequestType type,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        if (baseUrl != null) {
          _dio.options.baseUrl = baseUrl;
        }

        Response<dynamic> response;
        switch (type) {
          case RequestType.get:
            response = await _dio.get<dynamic>(
              path,
              data: body == null ? null : jsonEncode(body),
              queryParameters: queryParameters,
              options: Options(
                headers: ApiConstants.headers(additionalHeaders: headers),
              ),
            );
          case RequestType.post:
            response = await _dio.post<dynamic>(
              path,
              data: body == null ? null : jsonEncode(body),
              queryParameters: queryParameters,
              options: Options(
                headers: ApiConstants.headers(additionalHeaders: headers),
              ),
            );
          case RequestType.put:
            response = await _dio.put<dynamic>(
              path,
              data: body == null ? null : jsonEncode(body),
              queryParameters: queryParameters,
              options: Options(
                headers: ApiConstants.headers(additionalHeaders: headers),
              ),
            );
          case RequestType.delete:
            response = await _dio.delete<dynamic>(
              path,
              data: body == null ? null : jsonEncode(body),
              queryParameters: queryParameters,
              options: Options(
                headers: ApiConstants.headers(additionalHeaders: headers),
              ),
            );
        }
        final data = response.data as DataMap;
        final isSuccess = data['success'] as bool? ?? true;

        if (data['message'] == 'Unauthorized') {
          _removeUserCachedData();
          throw AppFailure(
            message: data['message'] as String,
            code: StatusCode.unauthenticated.code,
          );
        }

        if (isSuccess == true) {
          return response.data as DataMap;
        } else {
          throw AppFailure(
            message: data['smsError'] as String? ?? data['message'] as String,
            code: response.statusCode,
          );
        }
      } on DioException catch (exception) {
        if (exception.response?.statusCode == StatusCode.unauthenticated.code) {
          _removeUserCachedData();
        }
        throw AppFailure(
          message:
              (exception.response?.data as DataMap?)?['message'] as String? ??
                  exception.response?.statusMessage ??
                  AppStrings.unknownError.tr(),
          code: exception.response?.statusCode,
        );
      } catch (exception) {
        if (exception is AppFailure) {
          rethrow;
        }
        throw AppFailure(message: exception.toString());
      } finally {
        _dio.options.baseUrl = EnvService.baseUrl;
      }
    } else {
      throw AppFailure(message: AppStrings.noInternetConnection.tr());
    }
  }

  void _removeUserCachedData() {
    sl<RemoveUserUseCase>()();
    sl<RemoveTokenUseCase>()();
    sl<SharedData>()
      ..isUserAuthenticated = false
      ..userType = UserType.individual;
  }
}

Future<T> returnRemoteResponse<T>(Future<T> Function() requestAction) async {
  try {
    return requestAction();
  } on Exception {
    rethrow;
  }
}

ResultFuture<T> returnResponse<T>(Future<T> Function() requestAction) async {
  try {
    final response = await requestAction();
    return AppResult.right(response);
  } on AppFailure catch (failure) {
    return AppResult.left(failure);
  }
}
