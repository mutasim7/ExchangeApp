// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MyCalculatorWidget extends StatefulWidget {
  const MyCalculatorWidget({
    super.key,
    required this.calculatorcurrencyFromTo,
    required this.currencySold,
    required this.currencyBuying,
    required this.sold,
    required this.buying,
    // required this.textController1,
    // required this.textController2,
    required this.currencyName2,
    required this.currencyName1,
    required this.currencyCode2,
    required this.currencyCode1,
    required this.hintText1,
    required this.hintText2,
  });
  // final TextEditingController textController1;
  // final TextEditingController textController2;
  final String calculatorcurrencyFromTo;
  final String sold;
  final String buying;
  final String currencyName2;
  final String currencyName1;
  final String currencyCode2;
  final String currencyCode1;
  final String hintText1;
  final String hintText2;
  final double currencySold;
  final double currencyBuying;

  @override
  State<MyCalculatorWidget> createState() => _MyCalculatorWidgetState();
}

bool arrow_downward = false;
double convertedAmount = 0.0;
bool isSold = false;

class _MyCalculatorWidgetState extends State<MyCalculatorWidget> {
  late TextEditingController tryToUsdTextController;
  late TextEditingController usdToTryTextController;
  late TextEditingController sypToUsdTextController;
  late TextEditingController usdToSypTextController;
  late TextEditingController eurToUsdTextController;
  late TextEditingController usdToEurTextController;
  late TextEditingController sypToTryTextController;
  late TextEditingController tryToSypTextController;

  @override
  void initState() {
    tryToUsdTextController = TextEditingController();
    usdToTryTextController = TextEditingController();
    sypToUsdTextController = TextEditingController();
    usdToSypTextController = TextEditingController();
    eurToUsdTextController = TextEditingController();
    usdToEurTextController = TextEditingController();
    sypToTryTextController = TextEditingController();
    tryToSypTextController = TextEditingController();
    super.initState();
  }

  String activeTextField = 'none';

  void updateActiveTextField(String field) {
    setState(() {
      activeTextField = field;
    });
  }

  TextEditingController getController() {
    switch (widget.calculatorcurrencyFromTo) {
      case "حاسبة دولار < > ليرة تركية":
        return tryToUsdTextController;
      case "حاسبة ليرة سورية < > ليرة تركية":
        return tryToSypTextController;
      case "حاسبة دولار < > ليرة سورية":
        return sypToUsdTextController;
      case "حاسبة يورو < > دولار":
        return usdToEurTextController;
      default:
        return TextEditingController();
    }
  }

  TextEditingController getController1() {
    switch (widget.calculatorcurrencyFromTo) {
      case "حاسبة دولار < > ليرة تركية":
        return usdToTryTextController;
      case "حاسبة ليرة سورية < > ليرة تركية":
        return sypToTryTextController;
      case "حاسبة دولار < > ليرة سورية":
        return usdToSypTextController;
      case "حاسبة يورو < > دولار":
        return eurToUsdTextController;
      default:
        return TextEditingController();
    }
  }

  void updateConversion() {
    setState(() {
      double inputValue = double.tryParse(getController().text) ?? 0.0;
      convertedAmount = isSold
          ? inputValue * widget.currencySold
          : inputValue * widget.currencyBuying;

      usdToTryTextController.text = (tryToUsdTextController.text == '')
          ? '' // إذا كان convertedAmount يساوي صفر، قم بجعل النص فارغًا
          : (convertedAmount % 1 == 0)
              ? convertedAmount.toStringAsFixed(0)
              : convertedAmount.toString();

      sypToTryTextController.text = (tryToSypTextController.text == '')
          ? '' // إذا كان convertedAmount يساوي صفر، قم بجعل النص فارغًا
          : (convertedAmount % 1 == 0)
              ? convertedAmount.toStringAsFixed(0)
              : convertedAmount.toString();
      usdToSypTextController.text = (sypToUsdTextController.text == '')
          ? '' // إذا كان convertedAmount يساوي صفر، قم بجعل النص فارغًا
          : (convertedAmount % 1 == 0)
              ? convertedAmount.toStringAsFixed(0)
              : convertedAmount.toString();
      eurToUsdTextController.text = (usdToEurTextController.text == '')
          ? '' // إذا كان convertedAmount يساوي صفر، قم بجعل النص فارغًا
          : (convertedAmount % 1 == 0)
              ? convertedAmount.toStringAsFixed(0)
              : convertedAmount.toString();
    });
  }

  void updateConversion1() {
    setState(() {
      double inputValue = double.tryParse(getController1().text) ?? 0.0;
      convertedAmount = isSold
          ? inputValue / widget.currencySold
          : inputValue / widget.currencyBuying;

      tryToUsdTextController.text = (usdToTryTextController.text == '')
          ? '' // إذا كان convertedAmount يساوي صفر، قم بجعل النص فارغًا
          : (convertedAmount % 1 == 0)
              ? convertedAmount.toStringAsFixed(0)
              : convertedAmount.toStringAsFixed(2);
      tryToSypTextController.text = (sypToTryTextController.text == '')
          ? '' // إذا كان convertedAmount يساوي صفر، قم بجعل النص فارغًا
          : (convertedAmount % 1 == 0)
              ? convertedAmount.toStringAsFixed(0)
              : convertedAmount.toStringAsFixed(2);
      sypToUsdTextController.text = (usdToSypTextController.text == '')
          ? '' // إذا كان convertedAmount يساوي صفر، قم بجعل النص فارغًا
          : (convertedAmount % 1 == 0)
              ? convertedAmount.toStringAsFixed(0)
              : convertedAmount.toStringAsFixed(2);
      usdToEurTextController.text = (eurToUsdTextController.text == '')
          ? '' // إذا كان convertedAmount يساوي صفر، قم بجعل النص فارغًا
          : (convertedAmount % 1 == 0)
              ? convertedAmount.toStringAsFixed(0)
              : convertedAmount.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 1, 60, 106),
                Color.fromARGB(255, 41, 162, 186),
                Color.fromARGB(255, 1, 60, 106),
              ]),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.calculatorcurrencyFromTo,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (activeTextField == 'upper') {
                          isSold = true;
                          updateConversion();
                        } else if (activeTextField == 'lower') {
                          isSold = true;
                          updateConversion1();
                        }
                      });
                    },
                    child: Container(
                        width: size.width * 0.36,
                        height: size.width * 0.18,
                        decoration: const BoxDecoration(
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
                              widget.sold,
                              style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.36,
                    height: size.width * 0.18,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 1, 60, 106),
                        Color.fromARGB(255, 41, 162, 186),
                        Color.fromARGB(255, 1, 60, 106),
                      ]),
                    ),
                    child: Center(
                      child: Text(
                        (widget.currencySold % 1 ==
                                0) // يحقق ما إذا كان هناك أرقام بعد الفاصلة
                            ? widget.currencySold.toStringAsFixed(
                                0) // إذا لم يكن هناك أرقام بعد الفاصلة
                            : widget.currencySold
                                .toString(), // إذا كانت هناك أرقام بعد الفاصلة,,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 233, 240, 255),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (activeTextField == 'upper') {
                          isSold = false;
                          updateConversion();
                        } else if (activeTextField == 'lower') {
                          isSold = false;
                          updateConversion1();
                        }
                      });
                    },
                    child: Container(
                      width: size.width * 0.36,
                      height: size.width * 0.18,
                      decoration: const BoxDecoration(
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
                            widget.buying,
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.36,
                    height: size.width * 0.18 - 1,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 1, 60, 106),
                        Color.fromARGB(255, 41, 162, 186),
                        Color.fromARGB(255, 1, 60, 106),
                      ]),
                    ),
                    child: Center(
                      child: Text(
                        (widget.currencyBuying % 1 ==
                                0) // يحقق ما إذا كان هناك أرقام بعد الفاصلة
                            ? widget.currencyBuying.toStringAsFixed(
                                0) // إذا لم يكن هناك أرقام بعد الفاصلة
                            : widget.currencyBuying
                                .toString(), // إذا كانت هناك أرقام بعد الفاصلة
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 233, 240, 255)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  SizedBox(
                    height: size.width * 0.79,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 1, 60, 106),
                                Color.fromARGB(255, 41, 162, 186),
                                Color.fromARGB(255, 1, 60, 106),
                              ]),
                            ),
                            width: size.width * 0.61,
                            height: size.width * 0.39,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.currencyName1,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: TextField(
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                    ),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    controller: getController(),
                                    decoration: InputDecoration(
                                      hintText: widget.hintText1,
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        arrow_downward = false;
                                        updateActiveTextField('upper');
                                        updateConversion();
                                      });
                                    },
                                    onSubmitted: (value) {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.currencyCode1,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 1, 60, 106),
                                Color.fromARGB(255, 41, 162, 186),
                                Color.fromARGB(255, 1, 60, 106),
                              ]),
                            ),
                            width: size.width * 0.61,
                            height: size.width * 0.4,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.width * 0.07,
                                ),
                                Text(
                                  widget.currencyCode2,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 233, 240, 255),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: TextField(
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 204, 217, 243),
                                      fontSize: 25.0,
                                    ),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    controller: getController1(),
                                    decoration: InputDecoration(
                                      hintText: widget.hintText2,
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        arrow_downward = true;
                                        updateActiveTextField('lower');
                                        updateConversion1();
                                      });
                                    },
                                    onSubmitted: (value) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.currencyName2,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 233, 240, 255)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.yellowAccent,
                          height: 10,
                        ),
                        Positioned(
                          bottom: size.width * 0.34 - 2.5,
                          left: size.width * 0.25 - 3.25,
                          child: Container(
                            width: size.width * 0.12,
                            height: size.width * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromARGB(255, 41, 162, 186),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: size.width * 0.34,
                          left: size.width * 0.24 + 3,
                          child: Container(
                            width: size.width * 0.11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromARGB(255, 1, 60, 106),
                            ),
                            child: arrow_downward
                                ? const Icon(
                                    Icons.arrow_upward,
                                    size: 45,
                                    color: Color.fromARGB(255, 41, 162, 186),
                                  )
                                : const Icon(
                                    Icons.arrow_downward,
                                    size: 45,
                                    color: Color.fromARGB(255, 41, 162, 186),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          // Container(
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         bottomRight: Radius.circular(20),
          //         bottomLeft: Radius.circular(20)),
          //     color: Color.fromARGB(255, 248, 227, 198),
          //   ),
          //   width: double.infinity,
          //   height: 10,
          // ),
        ],
      ),
    );
  }
}
