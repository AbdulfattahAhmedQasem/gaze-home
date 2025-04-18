import 'package:gazhome/core/usecases/usecases.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/user_model.dart';
import 'package:gazhome/data/repos/auth_repo.dart';
import 'package:gazhome/data/requests/login_request.dart';
import 'package:gazhome/data/requests/register_request.dart';
import 'package:gazhome/data/requests/update_account_request.dart';

class LoginUseCase
    extends ResultFutureUseCaseWithParams<(UserModel, String), LoginRequest> {
  LoginUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<(UserModel, String)> call(LoginRequest request) {
    return _authRepo.login(request);
  }
}

class RegisterUseCase extends ResultFutureUseCaseWithParams<(UserModel, String),
    RegisterRequest> {
  RegisterUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<(UserModel, String)> call(RegisterRequest request) {
    return _authRepo.register(request);
  }
}

class SendCodeUseCase
    extends ResultFutureUseCaseWithParams<(UserModel, String), String> {
  SendCodeUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<(UserModel, String)> call(String phoneNumber) {
    return _authRepo.sendCode(phoneNumber);
  }
}

class VerifyCodeUseCase
    extends ResultFutureUseCaseWithParams<(UserModel, String), String> {
  VerifyCodeUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<(UserModel, String)> call(String code) {
    return _authRepo.verifyCode(code);
  }
}

class ConfirmCodeUseCase extends ResultFutureUseCaseWithParams<
    (UserModel, String), (String, String)> {
  ConfirmCodeUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<(UserModel, String)> call(
    (String phoneNumber, String code) request,
  ) {
    return _authRepo.confirmCode(request);
  }
}

class ResetPasswordUseCase
    extends ResultFutureUseCaseWithParams<(UserModel, String), String> {
  ResetPasswordUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<(UserModel, String)> call(String password) {
    return _authRepo.resetPassword(password);
  }
}

class UpdateAccountUseCase extends ResultFutureUseCaseWithParams<
    (UserModel, String), UpdateAccountRequest> {
  UpdateAccountUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<(UserModel, String)> call(UpdateAccountRequest request) {
    return _authRepo.updateAccount(request);
  }
}

class ChangePhoneNumberUseCase
    extends ResultFutureUseCaseWithParams<String, String> {
  ChangePhoneNumberUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<String> call(String newPhoneNumber) {
    return _authRepo.changePhoneNumber(newPhoneNumber);
  }
}

class VerifyPhoneNumberUseCase extends ResultFutureUseCaseWithParams<
    (UserModel, String), (String, String)> {
  VerifyPhoneNumberUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<(UserModel, String)> call(
    (String newPhoneNumber, String code) request,
  ) {
    return _authRepo.verifyPhoneNumber(request);
  }
}

class LogoutUseCase extends ResultFutureUseCaseWithoutParams<String> {
  LogoutUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<String> call() {
    return _authRepo.logout();
  }
}

class DeleteAccountUseCase extends ResultFutureUseCaseWithoutParams<String> {
  DeleteAccountUseCase(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<String> call() {
    return _authRepo.deleteAccount();
  }
}
