// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:currency_converter/providers/currencies_fun_provider.dart';
import 'package:currency_converter/widgets/MyCurrenciesWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({super.key});

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  @override
  Widget build(BuildContext context) {
    final currenciesfunProvider = Provider.of<CurrenciesfunProvider>(context);
    tz.initializeTimeZones();
    final syriaTimeZone = tz.getLocation('Asia/Damascus');

    // تحويل التاريخ إلى كائن DateTime
    final dateTime = DateTime.parse(currenciesfunProvider.get_updated_at ?? '');

    // تحويل التاريخ إلى توقيت سوريا
    final syriaDateTime = tz.TZDateTime.from(dateTime, syriaTimeZone);

    // تنسيق التاريخ كنص
    final formattedTime =
        DateFormat('yyyy-MM-dd hh:mm a').format(syriaDateTime);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/image/1.jpg'), // استبدل بمسار الصورة الخاصة بك
            fit: BoxFit.cover,
          ),
        ),
        child: LiquidPullToRefresh(
          height: 75,
          backgroundColor: Color.fromARGB(255, 41, 162, 186),
          color: Color.fromARGB(255, 1, 60, 106),
          onRefresh: () async {
            List<Future> futures = [
              currenciesfunProvider.getcurrencies_syp_try(),
              currenciesfunProvider.getcurrencies_syp_usd(),
              currenciesfunProvider.getcurrencies_try_usd(),
              currenciesfunProvider.getcurrencies_usd_eur(),
            ];

            // انتظار اكتمال جميع الطلبات في نفس الوقت
            await Future.wait(futures);

            currenciesfunProvider.updateLatestDateTime(
              currenciesfunProvider.get_updated_at_eur_usd,
              currenciesfunProvider.get_updated_at_try_usd,
              currenciesfunProvider.get_updated_at_syp_usd,
              currenciesfunProvider.get_updated_at_try_syp,
            );
            setState(() {});
          },
          showChildOpacityTransition: false,
          animSpeedFactor: 2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 1, 60, 106),
                      Color.fromARGB(255, 41, 162, 186),
                      Color.fromARGB(255, 1, 60, 106),
                    ]),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            formattedTime,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ": آخر تحديث",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        MyCurrenciesWidget(
                            currencyFromToArabic: "دولار - ليرة تركية",
                            currencyFromToEnglish: "TRY-USD",
                            currencySold:
                                currenciesfunProvider.gettry_usd_sold ?? 0,
                            currencyBuying:
                                currenciesfunProvider.gettry_usd_buying ?? 0,
                            sold: "مبيع",
                            buying: "شراء"),
                        SizedBox(
                          height: 10,
                        ),
                        MyCurrenciesWidget(
                            currencyFromToArabic: "ليرة تركية - ليرة سورية",
                            currencyFromToEnglish: "SYP-TRY",
                            currencySold:
                                currenciesfunProvider.gettry_syp_sold ?? 0,
                            currencyBuying:
                                currenciesfunProvider.gettry_syp_buying ?? 0,
                            sold: "مبيع",
                            buying: "شراء"),
                        SizedBox(
                          height: 10,
                        ),
                        MyCurrenciesWidget(
                            currencyFromToArabic: "دولار - ليرة سورية",
                            currencyFromToEnglish: "SYP-USD",
                            currencySold:
                                currenciesfunProvider.getsyp_usd_sold ?? 0,
                            currencyBuying:
                                currenciesfunProvider.getsyp_usd_buying ?? 0,
                            sold: "مبيع",
                            buying: "شراء"),
                        SizedBox(
                          height: 10,
                        ),
                        MyCurrenciesWidget(
                          currencyFromToArabic: "يورو - دولار",
                          currencyFromToEnglish: "USD-EUR",
                          currencySold:
                              currenciesfunProvider.geteur_usd_sold ?? 0,
                          currencyBuying:
                              currenciesfunProvider.geteur_usd_buying ?? 0,
                          sold: "مبيع",
                          buying: "شراء",
                        ),
                        // Text(formattedTime),
                      ],
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
