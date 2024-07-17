import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:intl/intl.dart';

class DateHelper {
  static String dateToString(
      {required DateTime date, String? format = 'dd/MM/yyyy'}) {
    return DateFormat(format, 'es').format(date);
  }

  static DateTime stringToDate(
      {required String dateString, String? format = 'dd-MM-yyyy HH:mm'}) {
    return DateFormat(format).parse(dateString);
  }

  static String humanizaDate({required DateTime date}) {
    return DateHelper.dateToString(
            date: date, format: "E dd MMM yyyy HH:mm 'hs'")
        .capitalize();
  }
}
