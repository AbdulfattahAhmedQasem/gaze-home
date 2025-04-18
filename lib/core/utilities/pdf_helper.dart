// ignore_for_file: avoid_slow_async_io

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/my_app.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfHelper {
  static late ThemeData _theme;

  static Future<void> init() async {
    _theme = ThemeData.withFont(
      base: Font.ttf(await rootBundle.load('assets/fonts/Arial-Regular.ttf')),
      bold: Font.ttf(await rootBundle.load('assets/fonts/Arial-Bold.ttf')),
    );
  }

  static Future<File?> generate({
    required String fileName,
    required Widget body,
    Widget? header,
    Widget? footer,
  }) async {
    final isRTL = navigatorKey.currentContext!.isRTL();
    final pdf = Document()
      ..addPage(
        Page(
          theme: _theme,
          pageFormat: PdfPageFormat.a4,
          orientation: PageOrientation.portrait,
          build: (context) {
            return Directionality(
              textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
              child: body,
            );
          },
        ),
      );

    return PdfHelper.saveDocument(fileName: fileName, pdf: pdf);
  }

  static Future<File?> saveDocument({
    required String fileName,
    required Document pdf,
  }) async {
    if (await AppFunctions.isStorageHasPermission()) {
      final bytes = await pdf.save();

      final storePath = await AppFunctions.getStorePath();
      final file = File('$storePath/$fileName');
      final isFileExists = await file.exists();

      return isFileExists ? file : await file.writeAsBytes(bytes);
    }
    return null;
  }
}
