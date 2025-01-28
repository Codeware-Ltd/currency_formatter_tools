```markdown
# Currency Formatter Tools

A Flutter package for advanced currency formatting and localization.

## Features

- Format numeric values as text with customizable decimal places.
- Format values with currency symbols, separators, and various customization options.
- Retrieve currency symbols from a list or map of currency data.

## Installation

Add the following to your `pubspec.yaml` file:

```
yaml
dependencies:
  currency_formatter_tools:
    path: ../ 
```

Run `flutter pub get` to fetch the dependencies.

## Usage

### Import the Package

```dart
import 'package:currency_formatter_tools/currency_formatter_tools.dart';
```

### Formatting Numeric Values as Text

Use the `formatAsText` method to format a numeric value as a `Text` widget with specified decimal places and an optional label.

```dart
Widget formattedText = CurrencyFormatterTools.formatAsText(
  value: 1234.56,
  decimalPlaces: 2,
  label: 'Amount',
  textStyle: TextStyle(fontSize: 16, color: Colors.black),
);
```

### Formatting Values with Currency Symbols

Use the `formatWithCurrency` method to format a value with a currency symbol, separators, and various customization options.

```dart
Widget formattedCurrency = CurrencyFormatterTools.formatWithCurrency(
  value: 1234.56,
  locale: 'en_US',
  currencySymbol: '\$',
  useLocaleFormatting: true,
  symbolOnRight: false,
  decimalPlaces: 2,
  label: 'Price',
  textStyle: TextStyle(fontSize: 16, color: Colors.black),
);
```

### Retrieving Currency Symbols

Use the `getCurrencySymbol` method to retrieve the currency symbol for a given currency ID from a list or map of currency data.

```dart
String currencySymbol = CurrencyFormatterTools.getCurrencySymbol(
  currencyData: [
    {'crID': 0, 'crTitle': 'Euro', 'crSymbol': '€'},
    {'crID': 1, 'crTitle': 'US Dollar', 'crSymbol': '\$'},
  ],
  currencyID: '0', // Use the ID as a string
);
```

## Example

Here is a complete example of how to use the `currency_formatter_tools` package in a Flutter application:

```dart
import 'package:flutter/material.dart';
import 'package:currency_formatter_tools/currency_formatter_tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Currency Formatter Tools')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrencyFormatterTools.formatAsText(
                value: 1234.56,
                decimalPlaces: 2,
                label: 'Amount',
                textStyle: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 20),
              CurrencyFormatterTools.formatWithCurrency(
                value: 1234.56,
                locale: 'en_US',
                currencySymbol: '\$',
                useLocaleFormatting: true,
                symbolOnRight: false,
                decimalPlaces: 2,
                label: 'Price',
                textStyle: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```