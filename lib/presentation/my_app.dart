import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/routing/app_router_imports.dart';
import 'package:gazhome/core/services/local_notifications_service.dart';
import 'package:gazhome/core/services/notifications_service.dart';
import 'package:gazhome/core/theming/app_theme.dart';
import 'package:gazhome/presentation/global_providers.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    LocalNotificationsService.initialize();
    NotificationsService.initialize().then((_) {
      NotificationsService.onMessage();
      NotificationsService.onMessageOpenedApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: ScreenUtilInit(
        designSize: AppSizes.screenSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: appTheme,
            onGenerateRoute: onGenerateRoute,
            builder:
                (context, child) => MediaQuery(
                  data: context.mediaQuery.copyWith(
                    textScaler: TextScaler.noScaling,
                  ),
                  child: child!,
                ),
          );
        },
      ),
    );
  }
}
