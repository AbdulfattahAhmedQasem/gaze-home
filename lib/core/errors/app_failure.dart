import 'package:equatable/equatable.dart';

class AppFailure extends Equatable implements Exception {
  const AppFailure({required this.message, this.code = 0});

  final String message;
  final int? code;

  @override
  List<Object?> get props => [message, code];
}
