// ignore_for_file: avoid_slow_async_io

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/services/env_service.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/models/address_model.dart';
import 'package:gazhome/presentation/dialogs/action_dialog.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AppFunctions {
  AppFunctions._();

  static Future<void> setPreferredOrientations() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static void changeStatusBarIconColors() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    );
  }

  static void unFocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showToast(
    String message, {
    Toast toastLength = Toast.LENGTH_LONG,
    MessageType type = MessageType.error,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: type.color,
      textColor: Colors.white,
      fontSize: getValueForScreenType(medium: 13, semiLarge: 8).sp,
    );
  }

  static Future<T?> showAppDialog<T>(
    BuildContext context, {
    required Widget child,
    Color? bgColor,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: bgColor ?? Colors.black38,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return PopScope(canPop: barrierDismissible, child: child);
      },
    );
  }

  static Future<void> showBottomSheet({
    required BuildContext context,
    required Widget child,
    Color? backgroundColor,
  }) async {
    return showModalBottomSheet<void>(
      context: context,
      constraints: const BoxConstraints(minWidth: double.infinity),
      isScrollControlled: true,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: AppSizes.elevation.r,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.bottomSheetRadius.r),
        ),
      ),
      builder: (context) => child,
    );
  }

  static Duration get duration150ms => const Duration(milliseconds: 150);
  static Duration get duration300ms => const Duration(milliseconds: 300);
  static Duration get duration500ms => const Duration(milliseconds: 500);
  static Duration get duration1s => const Duration(seconds: 1);
  static Duration get duration2s => const Duration(seconds: 2);
  static Duration get duration3s => const Duration(seconds: 3);
  static Duration get duration1m => const Duration(minutes: 1);
  static Duration get duration365d => const Duration(days: 365);

  static FilteringTextInputFormatter get decimalNumberFormatter =>
      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'));

  static FilteringTextInputFormatter get intNumberFormatter =>
      FilteringTextInputFormatter.allow(RegExp(r'^\d*?\d*'));

  static void handleCubitListener(
    BuildContext context, {
    required RequestState requestState,
    required String message,
    String? loadingMessage,
    VoidCallback? onLoaded,
    VoidCallback? onError,
  }) {
    if (requestState.isLoading()) {
      showAppDialog<void>(
        context,
        barrierDismissible: false,
        child: AppLoading.submit(message: loadingMessage),
      );
    } else if (requestState.hasError()) {
      context.closeDialogIfOppened();
      showToast(message);
      onError?.call();
    } else if (requestState.isLoaded()) {
      context.closeDialogIfOppened();
      onLoaded?.call();
    }
  }

  static String getImageUrl(String? image, {String? baseUrl}) {
    return image == null ? '' : '${baseUrl ?? EnvService.imageBaseUrl2}$image';
  }

  static void checkAuthenticated(BuildContext context, VoidCallback action) {
    if (sl<SharedData>().isUserAuthenticated) {
      action();
    } else {
      AppFunctions.showAppDialog<void>(
        context,
        child: ActionDialog(
          title: AppStrings.pleaseLoginToContinue.tr(),
          type: MessageType.error,
          onPressed: () {
            context
              ..pop()
              ..pushReplacementNamed(Routes.auth);
          },
        ),
      );
    }
  }

  static String formatAddress([AddressModel? address]) {
    return address == null
        ? AppStrings.pleaseSelectTheAddress.tr()
        : '${address.city} - ${address.state} - ${address.streetName} - ${address.buildingNumber}';
  }

  static OrderStatus getOrderStatus(String status) {
    late final OrderStatus orderStatus;
    if (status == 'cancelled') {
      orderStatus = OrderStatus.cancelled;
    } else if (status == 'pending') {
      orderStatus = OrderStatus.pending;
    } else if (status == 'shipped') {
      orderStatus = OrderStatus.shipped;
    } else if (status == 'delivered') {
      orderStatus = OrderStatus.delivered;
    }
    return orderStatus;
  }

  static Future<bool> isStorageHasPermission() async {
    final deviceInfo = DeviceInfoPlugin();

    var status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    } else {
      if (Platform.isAndroid) {
        final android = await deviceInfo.androidInfo;
        status =
            android.version.sdkInt < 33
                ? await Permission.storage.request()
                : PermissionStatus.granted;
      } else {
        status = await Permission.storage.request();
      }
      return status.isGranted;
    }
  }

  static Future<String> getStorePath() async {
    final tempDir =
        Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationSupportDirectory();
    final filePath = Directory('${tempDir!.path}/files');
    if (await filePath.exists()) {
      return filePath.path;
    } else {
      await filePath.create(recursive: true);
      return filePath.path;
    }
  }
}

void showLog(Object? object, [String? title]) {
  if (kDebugMode) {
    print('\n👉 ${title != null ? '$title: ' : ''} $object\n');
  }
}
