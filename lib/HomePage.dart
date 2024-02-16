import 'package:currency_converter/AboutUs_Screen.dart';
import 'package:currency_converter/Ads_screen.dart';
import 'package:currency_converter/Calculator_Screen.dart';
import 'package:currency_converter/currencies_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 133, 178, 255),
          title: const Text(
            "الشعار",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 1, 60, 106),
                    Color.fromARGB(255, 41, 162, 186),
                  ]),
                ),
                child: const Center(
                  child: Text(
                    "اسم الشركة",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
          bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: const Color.fromARGB(255, 1, 60, 106),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 1, 60, 106),
                    Color.fromARGB(255, 41, 162, 186),
                    Color.fromARGB(255, 1, 60, 106),
                  ]),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.brown),
              tabs: const [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("العملات",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("الحاسبة",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("إعلانات",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("من نحن",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                  ),
                ),
              ]),
        ),
        body: const TabBarView(
          children: [
            CurrenciesScreen(),
            CalculatorScreen(),
            AdsScreen(),
            AboutUsScreen(),
          ],
        ),
      ),
    );
  }
}
