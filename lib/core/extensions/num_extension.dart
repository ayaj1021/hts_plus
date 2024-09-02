import 'package:intl/intl.dart';

extension NumExtension on num? {
  String format([String? currency = '₦']) => (this == null)
      ? '${currency}0'
      : NumberFormat.currency(
          locale: 'en',
          name: currency,
          decimalDigits: this is int || this == this!.roundToDouble() ? 0 : 2,
        ).format(this);
}
