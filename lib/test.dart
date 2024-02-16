import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double dollarAmount = 0.0; // قيمة الدولار المدخلة
  double convertedAmount = 0.0; // القيمة المحولة
  String selectedCurrency = 'EUR'; // العملة المحددة للتحويل

  // قائمة بالعملات المتاحة
  List<String> currencies = ['EUR', 'GBP', 'JPY', 'CAD', 'AUD'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تحويل العملة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'المبلغ بالدولار',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  dollarAmount = double.tryParse(value) ?? 0.0;
                  convertCurrency();
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedCurrency,
              items: currencies.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                  convertCurrency();
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'المبلغ المحول: $convertedAmount $selectedCurrency',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  // دالة لتحويل العملة
  void convertCurrency() {
    // هنا يمكنك استخدام معدلات تحويل العملة الحقيقية أو القيم الثابتة حسب احتياجاتك
    Map<String, double> exchangeRates = {
      'EUR': 0.85,
      'GBP': 0.72,
      'JPY': 114.62,
      'CAD': 1.25,
      'AUD': 1.34,
    };

    double? rate = exchangeRates[selectedCurrency];
    setState(() {
      convertedAmount = dollarAmount * rate!;
    });
  }
}

void main() => runApp(MaterialApp(home: CurrencyConverter()));
