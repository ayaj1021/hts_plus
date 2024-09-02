extension StringExtensions on String {
  String get redactedEmail {
    final parts = split('@');
    final firstPart = parts.first;
    //replace all characters except the first and last 2 characters with *
    final redacted = firstPart
        .substring(0, firstPart.length - 2)
        .replaceAll(RegExp('.'), '*');
    return '$redacted@${parts.last}';
  }

  String get capitalize {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  dynamic removeSpecialCharacters({
    String currency = '₦',
    bool asString = true,
  }) {
    final v = replaceAll(',', '')
        .replaceAll(RegExp(r'[^\d\s.-]'), '')
        .replaceAll(currency, '');

    return asString ? v : double.tryParse(v) ?? 0;
  }
}
