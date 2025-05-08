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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Currency Formatter Tools'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Displaying a formatted text value
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CurrencyFormatterTools.formatAsText(
                      value: 1234.56789,
                      label: 'Price',
                      textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.red),
                    ),
                  ),
                ),
                // Displaying a formatted value with a currency symbol
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CurrencyFormatterTools.formatWithCurrency(
                      value: "749,000.0",
                      decimalPlaces: 2,
                      currencySymbol: '\$',
                      label: 'Price',
                      textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
                    ),
                  ),
                ),
                // Displaying the currency symbol for the given currency ID
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CurrencyFormatterTools.formatWithCurrency(
                      value: 1000,
                      currencySymbol: CurrencyFormatterTools.getCurrencySymbol(
                          currencyData: currencies, currencyID: '3'),
                      label: 'Price',
                      symbolOnRight: true,
                      textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}