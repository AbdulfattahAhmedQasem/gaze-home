part of 'di_imports.dart';

Future<void> _initCubits() async {
  sl
    ..registerFactory(MainCubit.new)
    ..registerFactory(RebuildCubit.new)
    ..registerFactory(() => SplashCubit(sl(), sl(), sl()))
    ..registerFactory(() => LoginCubit(sl(), sl(), sl(), sl()))
    ..registerFactory(() => RegisterCubit(sl()))
    ..registerFactory(() => ForgotPasswordCubit(sl(), sl()))
    ..registerFactoryParam<VerificationCodeCubit, String, void>(
      (phone, _) => VerificationCodeCubit(sl(), sl(), sl(), sl(), sl(), phone),
    )
    ..registerFactory(() => HomeCubit(sl(), sl(), sl(), sl()))
    ..registerFactory(() => CartCubit(sl(), sl(), sl(), sl()))
    ..registerFactory(() => SupportCubit(sl()))
    ..registerFactory(
      () => AccountCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
    )
    ..registerFactory(
      () => MapCubit(sl()),
    )
    ..registerFactoryParam<AddressCubit, LatLng?, void>(
      (latLng, _) => AddressCubit(sl(), sl(), sl(), latLng),
    )
    ..registerFactory(() => UserOrdersCubit(sl(), sl()))
    ..registerFactory(() => AddToCartCubit(sl()))
    ..registerFactoryParam<CounterCubit, int, int>(CounterCubit.new)
    ..registerFactory(() => FavoriteCubit(sl(), sl(), sl()))
    ..registerFactory(() => NotificationsCubit(sl(), sl()))
    ..registerFactory(() => MakeOrderCubit(sl(), sl()))
    ..registerFactory(() => NotificationsCountCubit(sl(), sl(), sl()))
    ..registerFactory(() => BookOrderCubit(sl(), sl()))
    ..registerFactory(() => DriverOrdersCubit(sl(), sl()))
    ..registerFactory(() => DriverOrderActionsCubit(sl(), sl(), sl(), sl()))
    ..registerFactory(() => InvoiceCubit(sl()));
}
