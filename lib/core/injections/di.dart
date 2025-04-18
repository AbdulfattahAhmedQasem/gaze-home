part of 'di_imports.dart';

final sl = GetIt.I;

Future<void> initInjection() async {
  await _initCore();
  await _initDataSoureces();
  await _initRepos();
  await _initUseCases();
  await _initCubits();
}

Future<void> _initCore() async {
  final dioFactory = await DioFactory.getDio();
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(() => SharedPreferencesLogger(prefs))
    ..registerLazySingleton(() => dioFactory)
    ..registerLazySingleton(InternetConnection.new)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerLazySingleton(() => ApiService(dio: sl(), networkInfo: sl()))
    ..registerLazySingleton(SharedData.new);
}
