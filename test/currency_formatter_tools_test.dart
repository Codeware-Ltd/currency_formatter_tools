
import 'package:flutter_test/flutter_test.dart';
import 'package:currency_formatter_tools/currency_formatter_tools.dart';

void main() {
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
  test('Currency formatting works correctly', () {
    final formatter = CurrencyFormatterTools();
    final formatted = CurrencyFormatterTools.getCurrencySymbol(
        currencyData: currencies, currencyID: '3');

    expect(formatted, '\u09F3');
  });
}
