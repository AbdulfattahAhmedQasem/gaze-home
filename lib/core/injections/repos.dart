part of 'di_imports.dart';

Future<void> _initRepos() async {
  sl
    ..registerLazySingleton<AppRepo>(() => AppRepo(sl(), sl()))
    ..registerLazySingleton(() => AuthRepo(sl()))
    ..registerLazySingleton(() => HomeRepo(sl()))
    ..registerLazySingleton(() => CartRepo(sl()))
    ..registerLazySingleton(() => AddressRepo(sl()))
    ..registerLazySingleton(() => OrderRepo(sl()))
    ..registerLazySingleton(() => FavoriteRepo(sl()))
    ..registerLazySingleton(() => NotificationRepo(sl(), sl()));
}
