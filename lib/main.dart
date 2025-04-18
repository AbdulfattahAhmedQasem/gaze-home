import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/services/env_service.dart';
import 'package:gazhome/core/services/languagge_service.dart';
import 'package:gazhome/core/services/notifications_service.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/my_bloc_observer.dart';
import 'package:gazhome/core/utilities/pdf_helper.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';
import 'package:gazhome/firebase_options.dart';
import 'package:gazhome/presentation/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppFunctions.setPreferredOrientations();
  // await awesomeNotificationInit();
  AppFunctions.changeStatusBarIconColors();
  await EnvService.loadEnv();
  await initInjection();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PdfHelper.init();
  NotificationsService.onBackgroundMessage();

  if (kDebugMode) {
    Bloc.observer = MyBlocObserver();
  }

  final languageCode = sl<GetLanguageCodeUseCase>()();

  runApp(
    EasyLocalization(
      path: LanguageService.path,
      supportedLocales: LanguageService.locales,
      useOnlyLangCode: true,
      startLocale: Locale(languageCode),
      fallbackLocale: defaultLanguage.locale,
      child: const MyApp(),
    ),
  );
}
