import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(
    this._isFirstTimeUseCase,
    this._isUserAuthenticatedUseCase,
    this._getUserUseCase,
  ) : super(const SplashState.language());

  final IsFirstTimeUseCase _isFirstTimeUseCase;
  final IsUserAuthenticatedUseCase _isUserAuthenticatedUseCase;
  final GetUserUseCase _getUserUseCase;

  void goToSecondScreen() {
    sl<SharedData>().isUserAuthenticated = _isUserAuthenticatedUseCase();
    Future.delayed(AppFunctions.duration3s, () {
      final isFirstTime = _isFirstTimeUseCase();
      if (isFirstTime) {
        emit(const SplashState.language());
      } else {
        sl<SharedData>().setUserType(
          _isUserAuthenticatedUseCase() ? _getUserUseCase().userType : null,
        );
        emit(const SplashState.main());
      }
    });
  }
}
