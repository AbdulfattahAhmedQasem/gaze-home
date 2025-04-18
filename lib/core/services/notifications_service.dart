import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_keys.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/services/local_notifications_service.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/presentation/cubit/notifications_count/notifications_count_cubit.dart';
import 'package:gazhome/presentation/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsService {
  NotificationsService._();

  static final _firebaseMessaging = FirebaseMessaging.instance;

  static Future<String> getFcm() async {
    try {
      return await _firebaseMessaging.getToken() ?? '1';
    } on Exception catch (_) {
      return '1';
    }
  }

  // myApp => init state
  static Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();

    // gives you the message on which user taps
    // and it opened the app from terminated state
    await _firebaseMessaging.getInitialMessage().then((message) async {
      showLog('getInitialMessage');
      if (message != null) {
        await _incrementNotificationsCountInBackground();
        sl<SharedData>().notificationMessage = message.data;
      }
    });
  }

  // when the app in forground -> myApp => init state
  static void onMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showLog('onMessage');
      showLog(message.data);
      if (message.notification != null) {
        _incrementNotificationsCountInForground();
        LocalNotificationsService.display(message);
      }
    });
  }

  // when the app in background but opened and user taps -> myApp => init state
  static void onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      showLog('onMessageOpenedApp');
      goToTargetScreen(message.data);
    });
  }

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    showLog('onBackgroundMessage');
    showLog(message.data);
    await _incrementNotificationsCountInBackground();
  }

  // when the app in background but opened -> main => before runApp
  static void onBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  }

  static void goToTargetScreen(DataMap data) {
    navigatorKey.currentContext!.pushNamed(Routes.notifications);
  }

  static void goToTargetScreenFromTerminated(BuildContext context) {
    sl<SharedData>().notificationMessage.clear();
    context.pushNamed(Routes.notifications);
  }

  static void _incrementNotificationsCountInForground() {
    navigatorKey.currentContext
        ?.read<NotificationsCountCubit>()
        .incrementNotificationsCount();
  }

  static Future<void> _incrementNotificationsCountInBackground() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    final count = prefs.getInt(AppKeys.kNotificationsCount) ?? 0;
    await prefs.setInt(AppKeys.kNotificationsCount, count + 1);
  }
}
