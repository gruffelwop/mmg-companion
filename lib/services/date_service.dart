import 'package:intl/intl.dart';

String getDateToday() {
  final DateTime now = DateTime.now();
  final DateTime today = DateTime(now.year, now.month, now.day);
  return DateFormat('dd.MM').format(today);
}

String getWeekdayToday() {
  final DateTime now = DateTime.now();
  final DateTime today = DateTime(now.year, now.month, now.day);
  return DateFormat('EEEE').format(today);
}

// String getDateTomorrow() {
//   final DateTime next = DateTime.now().add(const Duration(hours: 24));
//   final DateTime tomorrow = DateTime(next.year, next.month, next.day);
//   return DateFormat('dd.MM').format(tomorrow);
// }

// String getWeekdayTomorrow() {
//   final DateTime next = DateTime.now().add(const Duration(hours: 24));
//   final DateTime tomorrow = DateTime(next.year, next.month, next.day);
//   return DateFormat('EEEE').format(tomorrow);
// }
