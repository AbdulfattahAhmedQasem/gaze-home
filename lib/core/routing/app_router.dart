part of 'app_router_imports.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final arguments = settings.arguments;
  final routeName = settings.name;
  sl<SharedData>().routeName = routeName ?? '';

  showLog(routeName, 'routeName');

  switch (routeName) {
    case '/':
    case Routes.splash:
      return PageRoute(
        builder: (_) => BlocProvider<SplashCubit>(
          create: (context) => sl<SplashCubit>()..goToSecondScreen(),
          child: const SplashScreen(),
        ),
        settings: settings,
      );
    case Routes.language:
      return PageRoute(
        builder: (_) => const LanguageScreen(),
        settings: settings,
      );
    case Routes.onboarding:
      return PageRoute(
        builder: (_) => const OnboardingScreen(),
        settings: settings,
      );
    case Routes.auth:
      return PageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<LoginCubit>(create: (context) => sl<LoginCubit>()),
            BlocProvider<RegisterCubit>(
              create: (context) => sl<RegisterCubit>(),
            ),
          ],
          child: const AuthScreen(),
        ),
        settings: settings,
      );
    case Routes.forgotPassword:
      return PageRoute(
        builder: (_) => BlocProvider<ForgotPasswordCubit>(
          create: (context) => sl<ForgotPasswordCubit>(),
          child: ForgotPasswordScreen(
            step: arguments! as ForgotPasswordStep,
          ),
        ),
        settings: settings,
      );
    case Routes.verificationCode:
      final args = arguments! as DataMap;
      final route = args['route'] as VerificationCodeRoute;
      return PageRoute(
        builder: (_) => BlocProvider<VerificationCodeCubit>(
          create: (context) {
            final cubit = sl<VerificationCodeCubit>(
              param1: args['phone'] as String,
            );
            if (route.isFromLogin()) {
              Future.delayed(AppFunctions.duration150ms, cubit.resendCode);
            }
            return cubit;
          },
          child: VerificationCodeScreen(
            route: route,
            autoFocus: !route.isFromLogin(),
          ),
        ),
        settings: settings,
      );
    case Routes.main:
      if (sl<SharedData>().userType.isDriver()) {
        return PageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<DriverOrderActionsCubit>(
                create: (context) => sl<DriverOrderActionsCubit>(),
              ),
              BlocProvider<DriverOrdersCubit>(
                create: (context) => sl<DriverOrdersCubit>(),
              ),
            ],
            child: const MainScreen(),
          ),
          settings: settings,
        );
      } else {
        return PageRoute(
          builder: (_) => BlocProvider<HomeCubit>(
            create: (context) => sl<HomeCubit>()..getInitialData(),
            child: const MainScreen(),
          ),
          settings: settings,
        );
      }
    case Routes.notifications:
      return PageRoute(
        builder: (_) => BlocProvider<NotificationsCubit>(
          create: (context) => sl<NotificationsCubit>()..getNotifications(),
          child: const NotificationsScreen(),
        ),
        settings: settings,
      );
    case Routes.map:
      return PageRoute(
        builder: (_) => BlocProvider<MapCubit>(
          create: (_) => sl<MapCubit>()..getInitialLocation(),
          child: const MapScreen(),
        ),
        settings: settings,
      );
    case Routes.completeAddressData:
      final args = arguments! as (LatLng, MapCubit, Map<String, String>);
      return PageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: args.$2,
            ),
            BlocProvider<AddressCubit>(
              create: (_) => sl<AddressCubit>(param1: args.$1),
            ),
          ],
          child: const CompleteAddressDataScreen(),
        ),
        settings: settings,
      );
    case Routes.completeOrder:
      final makerOrderCubit = arguments! as MakeOrderCubit;
      return PageRoute(
        builder: (_) => BlocProvider.value(
          value: makerOrderCubit,
          child: const CompleteOrderScreen(),
        ),
        settings: settings,
      );
    case Routes.myFavorites:
      return PageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<FavoriteCubit>(
              create: (context) => sl<FavoriteCubit>()..getMyFavorites(),
            ),
            BlocProvider<AddToCartCubit>(
              create: (context) => sl<AddToCartCubit>(),
            ),
          ],
          child: const MyFavoritesScreen(),
        ),
        settings: settings,
      );
    case Routes.payment:
      return PageRoute(
        builder: (_) => PaymentScreen(paymentUrl: arguments! as String),
        settings: settings,
      );
    case Routes.invoice:
      return PageRoute(
        builder: (_) => BlocProvider<InvoiceCubit>(
          create: (context) => sl<InvoiceCubit>(),
          child: InvoiceScreen(order: arguments),
        ),
        settings: settings,
      );
    default:
      return PageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('${AppStrings.noRouteDefinedFor.tr()} $routeName'),
          ),
        ),
      );
  }
}
