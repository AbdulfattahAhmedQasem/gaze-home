import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';
import 'package:gazhome/presentation/cubit/book_order/book_order_cubit.dart';
import 'package:gazhome/presentation/cubit/home/home_cubit.dart';
import 'package:gazhome/presentation/cubit/rebuild/rebuild_cubit.dart';

Language get defaultLanguage => Language.ar;

enum Language {
  en('en', 'US', 'English'),
  ar('ar', 'SA', 'Arabic');

  const Language(this.langCode, this.countryCode, this.name);

  final String langCode;
  final String countryCode;
  final String name;
}

extension LanguageExtension on Language {
  Locale get locale => Locale(langCode);
  String get fullCode => '$langCode-$countryCode';
}

class LanguageService {
  const LanguageService._();

  static const path = 'assets/translations';

  static List<Locale> locales =
      Language.values.map((language) => language.locale).toList();

  static bool isRTL(BuildContext context) {
    return context.locale.languageCode == Language.ar.langCode;
  }

  static String currenCode(BuildContext context) {
    return context.locale.languageCode;
  }

  static Future<void> updateLanugage(
    BuildContext context, {
    Language? language,
  }) async {
    final lang = language ?? (isRTL(context) ? Language.en : Language.ar);
    await context.setLocale(lang.locale);
    if (language == null) {
      context.read<RebuildCubit>().rebuild();
    }
    await sl<CacheLanguageCodeUseCase>()(lang.langCode);
    if (sl<SharedData>().userType.isDriver()) {
      await context.read<BookOrderCubit>().getInitialData();
    } else {
      await context.read<HomeCubit>().getInitialData();
    }
  }
}
