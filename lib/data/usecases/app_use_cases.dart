import 'package:gazhome/core/usecases/usecases.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/user_model.dart';
import 'package:gazhome/data/repos/app_repo.dart';

/// Use case for sending complaints
class SendComplaintUseCase
    extends ResultFutureUseCaseWithParams<String, String> {
  SendComplaintUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  ResultFuture<String> call(String message) {
    return _appRepo.sendComplaint(message);
  }
}

/// Use case for caching first time app launch
class CacheFirstTimeUseCase extends FutureUseCaseWithoutParams<void> {
  CacheFirstTimeUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  Future<void> call() {
    return _appRepo.cacheFirstTime();
  }
}

/// Use case for checking if it's first time app launch
class IsFirstTimeUseCase extends UseCaseWithoutParams<bool> {
  IsFirstTimeUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  bool call() {
    return _appRepo.isFirstTime();
  }
}

/// Use case for caching language code
class CacheLanguageCodeUseCase extends FutureUseCaseWithParams<void, String> {
  CacheLanguageCodeUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  Future<void> call(String code) {
    return _appRepo.cacheLanguageCode(code);
  }
}

/// Use case for getting cached language code
class GetLanguageCodeUseCase extends UseCaseWithoutParams<String> {
  GetLanguageCodeUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  String call() {
    return _appRepo.getLanguageCode();
  }
}

/// Use case for caching user data
class CacheUserUseCase extends FutureUseCaseWithParams<void, UserModel> {
  CacheUserUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  Future<void> call(UserModel user) async {
    await _appRepo.cacheUser(user);
  }
}

/// Use case for getting cached user data
class GetUserUseCase extends UseCaseWithoutParams<UserModel> {
  GetUserUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  UserModel call() {
    return _appRepo.getUser();
  }
}

/// Use case for removing cached user data
class RemoveUserUseCase extends FutureUseCaseWithoutParams<void> {
  RemoveUserUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  Future<void> call() async {
    await _appRepo.removeUser();
  }
}

/// Use case for caching authentication token
class CacheTokenUseCase extends FutureUseCaseWithParams<void, String> {
  CacheTokenUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  Future<void> call(String token) async {
    await _appRepo.cacheToken(token);
  }
}

/// Use case for getting cached authentication token
class GetTokenUseCase extends UseCaseWithoutParams<String> {
  GetTokenUseCase(this._appRepo);
  final AppRepo _appRepo;

  @override
  String call() {
    return _appRepo.getToken();
  }
}

/// Use case for removing cached authentication token
class RemoveTokenUseCase extends FutureUseCaseWithoutParams<void> {
  RemoveTokenUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  Future<void> call() async {
    await _appRepo.removeToken();
  }
}

/// Use case for checking if user is authenticated
class IsUserAuthenticatedUseCase extends UseCaseWithoutParams<bool> {
  IsUserAuthenticatedUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  bool call() {
    return _appRepo.isUserAuthenticated();
  }
}

/// Use case for incrementing notifications count
class IncrementNotificationsCountUseCase
    extends FutureUseCaseWithoutParams<void> {
  IncrementNotificationsCountUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  Future<void> call() async {
    await _appRepo.incrementNotificationsCount();
  }
}

/// Use case for resetting notifications count
class ResetNotificationsCountUseCase extends FutureUseCaseWithoutParams<void> {
  ResetNotificationsCountUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  Future<void> call() async {
    await _appRepo.resetNotificationsCount();
  }
}

/// Use case for getting notifications count
class GetNotificationsCountUseCase extends FutureUseCaseWithoutParams<int> {
  GetNotificationsCountUseCase(this._appRepo);

  final AppRepo _appRepo;

  @override
  Future<int> call() async {
    return _appRepo.getNotificationsCount();
  }
}
