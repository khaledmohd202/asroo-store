import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String getFormatDayMonthYear() {
    final formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(this);
  }
}
