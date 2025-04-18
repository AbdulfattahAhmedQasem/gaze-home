import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/networking/api_constants.dart';
import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/user_model.dart';
import 'package:gazhome/data/requests/login_request.dart';
import 'package:gazhome/data/requests/register_request.dart';
import 'package:gazhome/data/requests/update_account_request.dart';

class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<(UserModel, String)> login(LoginRequest request) async {
    return returnRemoteResponse<(UserModel, String)>(() async {
      final response = await _apiService.post(
        sl<SharedData>().userType.isDriver()
            ? ApiConstants.driverLogin
            : ApiConstants.userLogin,
        body: request.toMap(),
      );
      return (
        UserModel.fromMap(response['data'] as DataMap),
        response['message'] as String,
      );
    });
  }

  Future<(UserModel, String)> register(RegisterRequest request) async {
    return returnRemoteResponse<(UserModel, String)>(() async {
      final response = await _apiService.post(
        ApiConstants.register,
        body: request.toMap(),
      );
      return (
        UserModel.fromMap(response['data'] as DataMap),
        response['message'] as String,
      );
    });
  }

  Future<(UserModel, String)> sendCode(String phoneNumber) async {
    return returnRemoteResponse<(UserModel, String)>(() async {
      final response = await _apiService.post(
        sl<SharedData>().userType.isDriver()
            ? ApiConstants.driverSendCode
            : ApiConstants.userSendCode,
        body: {'phone_number': '+966$phoneNumber'},
      );
      return (
        UserModel.fromMap(response['data'] as DataMap),
        response['message'] as String,
      );
    });
  }

  Future<(UserModel, String)> verifyCode(String code) async {
    return returnRemoteResponse<(UserModel, String)>(() async {
      final response = await _apiService.post(
        sl<SharedData>().userType.isDriver()
            ? ApiConstants.driverVeryfyCode
            : ApiConstants.userVeryfyCode,
        headers: ApiConstants.headers(tempToken: sl<SharedData>().token),
        body: {'code': code},
      );
      return (
        UserModel.fromMap(response['data'] as DataMap),
        response['message'] as String,
      );
    });
  }

  Future<(UserModel, String)> confirmCode(
    (String phoneNumber, String code) request,
  ) async {
    return returnRemoteResponse<(UserModel, String)>(() async {
      final response = await _apiService.post(
        ApiConstants.confirmedCode,
        body: {'phone_number': '+966${request.$1}', 'code': request.$2},
      );
      return (
        UserModel.fromMap(response['data'] as DataMap),
        response['message'] as String,
      );
    });
  }

  Future<(UserModel, String)> resetPassword(String password) async {
    return returnRemoteResponse<(UserModel, String)>(() async {
      final response = await _apiService.post(
        sl<SharedData>().userType.isDriver()
            ? ApiConstants.driverResetPassword
            : ApiConstants.userResetPassword,
        headers: ApiConstants.headers(tempToken: sl<SharedData>().token),
        body: {
          'password': '+966$password',
          'password_confirmation': '+966$password',
        },
      );
      return (
        UserModel.fromMap(response['data'] as DataMap),
        response['message'] as String,
      );
    });
  }

  Future<(UserModel, String)> updateAccount(
    UpdateAccountRequest request,
  ) async {
    return returnRemoteResponse<(UserModel, String)>(() async {
      final response = await _apiService.put(
        ApiConstants.updateAccount,
        body: request.toMap(),
      );
      return (
        UserModel.fromMap(response['user'] as DataMap),
        response['message'] as String,
      );
    });
  }

  Future<String> changePhoneNumber(String newPhoneNumber) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.changePhone,
        body: {'new_phone_number': '+966$newPhoneNumber'},
      );
      return response['message'] as String;
    });
  }

  Future<(UserModel, String)> verifyPhoneNumber(
    (String newPhoneNumber, String code) request,
  ) async {
    return returnRemoteResponse<(UserModel, String)>(() async {
      final response = await _apiService.post(
        ApiConstants.verifyPhone,
        body: {
          'new_phone_number': '+966${request.$1}',
          'verification_code': request.$2,
        },
      );
      return (
        UserModel.fromMap(response['data'] as DataMap),
        response['message'] as String,
      );
    });
  }

  Future<String> logout() async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.get(
        sl<SharedData>().userType.isDriver()
            ? ApiConstants.driverLogout
            : ApiConstants.userLogout,
      );
      return response['message'] as String;
    });
  }

  Future<String> deleteAccount() async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        sl<SharedData>().userType.isDriver()
            ? ApiConstants.driverDeleteAccount
            : ApiConstants.userDeleteAccount,
      );
      return response['message'] as String;
    });
  }
}
