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
    final displayText =
        label != null ? '$label: $formattedValue' : formattedValue;

    return Text(
      displayText,
      style: textStyle,
    );
  }

  /// Formats a value with a currency symbol, separators, and customization options.
  static Widget formatWithCurrency({
    required dynamic value,
    String locale = 'en_US',
    String currencySymbol = '',
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
      value = value.replaceAll(',', '');
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
  ///
  /// The `currencyData` parameter can be a list or map containing currency information.
  /// Each currency entry should have the following structure:
  /// ```
  /// {
  ///   "crID": 0,
  ///   "crTitle": "Euro",
  ///   "crSymbol": "\u20ac",
  /// }
  /// ```
  ///
  /// The `currencyID` parameter is the ID of the currency for which the symbol is to be retrieved.
  ///
  /// Returns the currency symbol as a string. If the currency ID is not found, returns an empty string.
  ///
  /// Throws an [ArgumentError] if `currencyData` or `currencyID` is not provided.

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
