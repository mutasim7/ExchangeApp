import 'package:flutter/material.dart';

class MyCurrenciesWidget extends StatelessWidget {
  const MyCurrenciesWidget(
      {super.key,
      required this.currencyFromToArabic,
      required this.currencyFromToEnglish,
      required this.currencySold,
      required this.currencyBuying,
      required this.sold,
      required this.buying});

  final String currencyFromToArabic;
  final String currencyFromToEnglish;
  final String sold;
  final String buying;
  final double currencySold;
  final double currencyBuying;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 1, 60, 106),
              Color.fromARGB(255, 41, 162, 186),
              Color.fromARGB(255, 1, 60, 106),
            ]),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(width: 2, color: Colors.white),
          ),
          width: size.width * 0.90,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                currencyFromToArabic,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  currencyFromToEnglish,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 13,
                      ),
                      Container(
                          width: 135.0,
                          height: 50.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 1, 60, 106),
                              Color.fromARGB(255, 41, 162, 186),
                              Color.fromARGB(255, 1, 60, 106),
                            ]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40, right: 30),
                            child: Center(
                              child: Text(
                                sold,
                                style: const TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 135.0,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32, right: 31),
                          child: Center(
                            child: Text(
                              buying,
                              style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 13,
                      ),
                      Container(
                        width: 135.0,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        child: Center(
                          child: Text(
                            (currencySold % 1 ==
                                    0) // يحقق ما إذا كان هناك أرقام بعد الفاصلة
                                ? currencySold.toStringAsFixed(
                                    0) // إذا لم يكن هناك أرقام بعد الفاصلة
                                : currencySold
                                    .toString(), // إذا كانت هناك أرقام بعد الفاصلة,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 135.0,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        child: Center(
                          child: Text(
                            (currencyBuying % 1 ==
                                    0) // يحقق ما إذا كان هناك أرقام بعد الفاصلة
                                ? currencyBuying.toStringAsFixed(
                                    0) // إذا لم يكن هناك أرقام بعد الفاصلة
                                : currencyBuying
                                    .toString(), // إذا كانت هناك أرقام بعد الفاصلة
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
