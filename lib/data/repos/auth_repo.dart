import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/datasources/remote/auth_remote_data_source.dart';
import 'package:gazhome/data/models/user_model.dart';
import 'package:gazhome/data/requests/login_request.dart';
import 'package:gazhome/data/requests/register_request.dart';
import 'package:gazhome/data/requests/update_account_request.dart';

class AuthRepo {
  const AuthRepo(this._authRemoteDataSource);

  final AuthRemoteDataSource _authRemoteDataSource;

  ResultFuture<(UserModel, String)> login(LoginRequest request) async {
    return returnResponse<(UserModel, String)>(() async {
      return _authRemoteDataSource.login(request);
    });
  }

  ResultFuture<(UserModel, String)> register(RegisterRequest request) async {
    return returnResponse<(UserModel, String)>(() async {
      return _authRemoteDataSource.register(request);
    });
  }

  ResultFuture<(UserModel, String)> sendCode(String phoneNumber) async {
    return returnResponse<(UserModel, String)>(() async {
      return _authRemoteDataSource.sendCode(phoneNumber);
    });
  }

  ResultFuture<(UserModel, String)> verifyCode(String code) async {
    return returnResponse<(UserModel, String)>(() async {
      return _authRemoteDataSource.verifyCode(code);
    });
  }

  ResultFuture<(UserModel, String)> confirmCode(
    (String phoneNumber, String code) request,
  ) async {
    return returnResponse<(UserModel, String)>(() async {
      return _authRemoteDataSource.confirmCode(request);
    });
  }

  ResultFuture<(UserModel, String)> resetPassword(String password) async {
    return returnResponse<(UserModel, String)>(() async {
      return _authRemoteDataSource.resetPassword(password);
    });
  }

  ResultFuture<(UserModel, String)> updateAccount(
    UpdateAccountRequest request,
  ) async {
    return returnResponse<(UserModel, String)>(() async {
      return _authRemoteDataSource.updateAccount(request);
    });
  }

  ResultFuture<String> changePhoneNumber(String newPhoneNumber) async {
    return returnResponse<String>(() async {
      return _authRemoteDataSource.changePhoneNumber(newPhoneNumber);
    });
  }

  ResultFuture<(UserModel, String)> verifyPhoneNumber(
    (String newPhoneNumber, String code) request,
  ) async {
    return returnResponse<(UserModel, String)>(() async {
      return _authRemoteDataSource.verifyPhoneNumber(request);
    });
  }

  ResultFuture<String> logout() async {
    return returnResponse<String>(() async {
      return _authRemoteDataSource.logout();
    });
  }

  ResultFuture<String> deleteAccount() async {
    return returnResponse<String>(() async {
      return _authRemoteDataSource.deleteAccount();
    });
  }
}
