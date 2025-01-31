import 'package:flutter/material.dart';
import 'package:currency_formatter_tools/currency_formatter_tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> currencies = [
      {
        "crID": 0,
        "crTitle": "Euro",
        "crSymbol": "\u20ac",
      },
      {
        "crID": 1,
        "crTitle": "US Dollar",
        "crSymbol": "\u0024",
      },
      {
        "crID": 3,
        "crTitle": "TK",
        "crSymbol": "\u09F3",
      }
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Currency Formatter Tools')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Displaying a formatted text value
              CurrencyFormatterTools.formatAsText(
                value: 1234.56789,
                label: 'Price',
                textStyle: const TextStyle(fontSize: 24),
              ),
              // Displaying a formatted value with a currency symbol
              CurrencyFormatterTools.formatWithCurrency(
                value: 1232344.5212,
                decimalPlaces: 3,
                currencySymbol: '\$',
                label: 'Price',
                textStyle: const TextStyle(fontSize: 24),
              ),
              // Displaying the currency symbol for the given currency ID
              CurrencyFormatterTools.formatWithCurrency(
                value: 1000,
                currencySymbol: CurrencyFormatterTools.getCurrencySymbol(
                    currencyData: currencies, currencyID: '3'),
                label: 'Price',
                symbolOnRight: true,
                textStyle: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
