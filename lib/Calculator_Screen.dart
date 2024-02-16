import 'package:currency_converter/providers/currencies_fun_provider.dart';
import 'package:currency_converter/widgets/MyCalculatorWidget.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final currenciesfunProvider = Provider.of<CurrenciesfunProvider>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/image/1.jpg'), // استبدل بمسار الصورة الخاصة بك
            fit: BoxFit.cover,
          ),
        ),
        child: LiquidPullToRefresh(
          backgroundColor: const Color.fromARGB(255, 41, 162, 186),
          color: const Color.fromARGB(255, 1, 60, 106),
          onRefresh: () async {
            List<Future> futures = [
              currenciesfunProvider.getcurrencies_syp_try(),
              currenciesfunProvider.getcurrencies_syp_usd(),
              currenciesfunProvider.getcurrencies_try_usd(),
              currenciesfunProvider.getcurrencies_usd_eur(),
            ];

            // انتظار اكتمال جميع الطلبات في نفس الوقت
            await Future.wait(futures);
            setState(() {});
          },
          showChildOpacityTransition: false,
          animSpeedFactor: 2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyCalculatorWidget(
                    calculatorcurrencyFromTo: "حاسبة دولار < > ليرة تركية",
                    currencySold: currenciesfunProvider.gettry_usd_sold ?? 0,
                    currencyBuying:
                        currenciesfunProvider.gettry_usd_buying ?? 0,
                    sold: "مبيع",
                    buying: "شراء",
                    currencyName2: "ليرة تركية",
                    currencyName1: "دولار",
                    currencyCode2: "TYR",
                    currencyCode1: "USD",
                    hintText1: "أدخل القيمة ",
                    hintText2: "أدخل القيمة  "),
                MyCalculatorWidget(
                    calculatorcurrencyFromTo: "حاسبة ليرة سورية < > ليرة تركية",
                    currencySold: currenciesfunProvider.gettry_syp_sold ?? 0,
                    currencyBuying:
                        currenciesfunProvider.gettry_syp_buying ?? 0,
                    sold: "مبيع",
                    buying: "شراء",
                    currencyName2: "ليرة تركية",
                    currencyName1: "ليرة سورية",
                    currencyCode2: "TYR",
                    currencyCode1: "SYP",
                    hintText1: "أدخل القيمة",
                    hintText2: "أدخل القيمة"),
                MyCalculatorWidget(
                    calculatorcurrencyFromTo: "حاسبة دولار < > ليرة سورية",
                    currencySold: currenciesfunProvider.getsyp_usd_sold ?? 0,
                    currencyBuying:
                        currenciesfunProvider.getsyp_usd_buying ?? 0,
                    sold: "مبيع",
                    buying: "شراء",
                    currencyName2: "ليرة سورية",
                    currencyName1: "دولار",
                    currencyCode2: "SYP",
                    currencyCode1: "USD",
                    hintText1: "أدخل القيمة ",
                    hintText2: "أدخل القيمة  "),
                MyCalculatorWidget(
                    calculatorcurrencyFromTo: "حاسبة يورو < > دولار",
                    currencySold: currenciesfunProvider.geteur_usd_sold ?? 0,
                    currencyBuying:
                        currenciesfunProvider.geteur_usd_buying ?? 0,
                    sold: "مبيع",
                    buying: "شراء",
                    currencyName2: "دولار",
                    currencyName1: "يورو",
                    currencyCode2: "USD",
                    currencyCode1: "EUR",
                    hintText1: "أدخل القيمة ",
                    hintText2: "أدخل القيمة  "),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
