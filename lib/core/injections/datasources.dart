part of 'di_imports.dart';

Future<void> _initDataSoureces() async {
  sl
    ..registerLazySingleton(() => AppLocalDataSource(sl()))
    ..registerLazySingleton(() => AppRemoteDataSource(sl()))
    ..registerLazySingleton(() => AuthRemoteDataSource(sl()))
    ..registerLazySingleton(() => HomeRemoteDataSource(sl()))
    ..registerLazySingleton(() => CartRemoteDataSource(sl()))
    ..registerLazySingleton(() => AddressRemoteDataSource(sl()))
    ..registerLazySingleton(() => OrderRemoteDataSource(sl()))
    ..registerLazySingleton(() => FavoriteRemoteDataSource(sl()))
    ..registerLazySingleton(() => NotificationRemoteDataSource(sl()));
}
