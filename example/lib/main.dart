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
          child: CurrencyFormatterTools.formatWithCurrency(
            value: 1234.56,
            currencySymbol: '€',
            label: 'Price',
            symbolOnRight: true,
            textStyle: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}