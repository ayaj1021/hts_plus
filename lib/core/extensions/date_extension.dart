extension DateExtension on DateTime {
  String toFormattedString() {
    return '$year-$month-$day';
  }

  String get dateOnly => toIso8601String().split('T').first;
  
}
