import 'package:bloc/bloc.dart';

class RebuildCubit extends Cubit<bool> {
  RebuildCubit() : super(false);

  void rebuild() {
    emit(!state);
  }
}
