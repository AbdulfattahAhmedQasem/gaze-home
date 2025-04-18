import 'package:gazhome/core/utilities/typedefs.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  Type call(Params param);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();
  Type call();
}

abstract class FutureUseCaseWithParams<Type, Params> {
  const FutureUseCaseWithParams();
  Future<Type> call(Params param);
}

abstract class FutureUseCaseWithoutParams<Type> {
  const FutureUseCaseWithoutParams();
  Future<Type> call();
}

abstract class ResultFutureUseCaseWithParams<Type, Params> {
  const ResultFutureUseCaseWithParams();
  ResultFuture<Type> call(Params param);
}

abstract class ResultFutureUseCaseWithoutParams<Type> {
  const ResultFutureUseCaseWithoutParams();
  ResultFuture<Type> call();
}
