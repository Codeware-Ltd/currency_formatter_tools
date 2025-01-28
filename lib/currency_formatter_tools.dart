library currency_formatter_tools;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A collection of tools for formatting currency and numbers.
class CurrencyFormatterTools {
  /// Formats a numeric value to a `Text` widget with specified decimal places and an optional label.
  static Widget formatAsText({
    required double value,
    int decimalPlaces = 2,
    String? label,
    TextStyle? textStyle,
  }) {
    final formattedValue = value.toStringAsFixed(decimalPlaces);
    final displayText = label != null ? '$label: $formattedValue' : formattedValue;

    return Text(
      displayText,
      style: textStyle,
    );
  }

  /// Formats a value with a currency symbol, separators, and customization options.
  static Widget formatWithCurrency({
    required dynamic value,
    String locale = 'en_US',
    String currencySymbol = '\$',
    bool useLocaleFormatting = true,
    bool symbolOnRight = false,
    int decimalPlaces = 2,
    String? label,
    TextStyle? textStyle,
  }) {
    if (value == null || (value is! num && value is! String)) {
      throw ArgumentError('Value must be a number or a parsable string');
    }

    if (value is String) {
      value = double.tryParse(value) ?? 0.0;
    }

    final formattedValue = useLocaleFormatting
        ? NumberFormat.currency(
      locale: locale,
      symbol: '',
      decimalDigits: decimalPlaces,
    ).format(value)
        : value.toStringAsFixed(decimalPlaces);

    final currencyText = symbolOnRight
        ? '$formattedValue $currencySymbol'
        : '$currencySymbol$formattedValue';

    final displayText = label != null ? '$label: $currencyText' : currencyText;

    return Text(
      displayText,
      style: textStyle,
    );
  }

  /// Retrieves the currency symbol for a given currency ID from a list or map.
  static String getCurrencySymbol({
    required dynamic currencyData,
    required String currencyID,
  }) {
    if (currencyData == null || currencyID.isEmpty) {
      throw ArgumentError('Both currencyData and currencyID must be provided');
    }

    if (currencyData is Map) {
      final currency = currencyData[currencyID];
      return currency?['crSymbol'] ?? '';
    }

    if (currencyData is List) {
      for (final currency in currencyData) {
        if (currency['crID'].toString() == currencyID) {
          return currency['crSymbol'] ?? '';
        }
      }
    }

    return '';
  }
}
