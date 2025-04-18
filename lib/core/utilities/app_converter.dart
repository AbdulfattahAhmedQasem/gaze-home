import 'package:easy_localization/easy_localization.dart';
import 'package:gazhome/core/utilities/app_functions.dart';

class AppConverter {
  const AppConverter._();

  static final _dateFormat = DateFormat('dd/MM/yyyy', 'en');

  static DateTime formatTextToDate(String date) {
    try {
      return _dateFormat.parse(date).toLocal();
    } on Exception catch (e) {
      showLog(e.toString());
      return DateTime.now();
    }
  }

  static String formatDateToText(DateTime date) {
    return '${date.day > 9 ? date.day : '0${date.day}'}/${date.month > 9 ? date.month : '0${date.month}'}/${date.year}';
  }

  static String parseApiDate(String date) {
    try {
      return _dateFormat.format(DateTime.parse(date));
    } on Exception catch (e) {
      showLog(e.toString());
      return '';
    }
  }

  static String formatDateForApiRequest(String date) {
    final day = date.substring(0, 2);
    final month = date.substring(3, 5);
    final year = date.substring(6);
    return '$year-$month-$day';
  }
}
