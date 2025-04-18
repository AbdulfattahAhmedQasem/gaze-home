import 'package:bloc/bloc.dart';
import 'package:gazhome/core/utilities/app_functions.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    showLog('${bloc.runtimeType}', 'onCreate');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    showLog('${bloc.runtimeType}, $change', 'onChange');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    showLog('${bloc.runtimeType}, $error', 'onError');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    showLog('${bloc.runtimeType}', 'onClose');
  }
}
