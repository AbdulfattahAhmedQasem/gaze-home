import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';

class NotificationsCountCubit extends Cubit<int> {
  NotificationsCountCubit(
    this._incrementNotificationsCountUseCase,
    this._resetNotificationsCountUseCase,
    this._getNotificationsCountUseCase,
  ) : super(0);

  final IncrementNotificationsCountUseCase _incrementNotificationsCountUseCase;
  final ResetNotificationsCountUseCase _resetNotificationsCountUseCase;
  final GetNotificationsCountUseCase _getNotificationsCountUseCase;

  Future<void> getNotificationsCount() async {
    emit(await _getNotificationsCountUseCase());
  }

  void incrementNotificationsCount() {
    _incrementNotificationsCountUseCase();
    emit(state + 1);
  }

  void resetNotificationsCount() {
    _resetNotificationsCountUseCase();
    emit(0);
  }
}
