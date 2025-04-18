import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:url_launcher/url_launcher.dart' as ul;

class AppLauncher {
  const AppLauncher._();

  static Future<void> launchUrl(
    BuildContext context, {
    String url = '',
    Uri? uri,
  }) async {
    try {
      final newUri = uri ?? Uri.parse(url);

      if (!await ul.launchUrl(newUri)) {
        if (context.mounted) {
          AppFunctions.showToast('${AppStrings.unknownError.tr()}: $uri');
        }
      }
    } on Exception catch (exception) {
      if (context.mounted) {
        AppFunctions.showToast(exception.toString());
      }
    }
  }

  static Future<void> launchWhatsApp(BuildContext context, String phone) async {
    var url = '';

    if (Platform.isIOS) {
      url = 'https://wa.me/+966$phone';
    } else {
      url = 'whatsapp://send?phone=+966$phone';
    }
    await launchUrl(context, url: url);
  }

  static Future<void> launchDialer(BuildContext context, String phone) async {
    final url = 'tel:+966$phone';
    await launchUrl(context, url: url);
  }

  static Future<void> launchGoogleMap(
    BuildContext context, {
    required double latitude,
    required double longitude,
  }) async {
    final googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    await launchUrl(context, url: googleUrl);
  }
}
