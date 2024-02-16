import 'package:currency_converter/widgets/Abute_us_widget.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/image/1.jpg'), // استبدل بمسار الصورة الخاصة بك
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 1, 60, 106),
                      Color.fromARGB(255, 41, 162, 186),
                      Color.fromARGB(255, 1, 60, 106),
                    ]),
                  ),
                  child: const Center(
                    child: Text(
                      "اسم الشركة",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  const Center(
                    child: AbuteUsWidget(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 1, 60, 106),
                          Color.fromARGB(255, 41, 162, 186),
                          Color.fromARGB(255, 1, 60, 106),
                        ]),
                      ),
                      width: 370,
                      text: "معلومات التواصل",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 243,
                        text: "+90 535 333 65 43",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 122.8,
                        text: "صرافة",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 243,
                        text: "+90 535 333 65 43",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 122.8,
                        text: "حوالات",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 243,
                        text: "",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 122.8,
                        text: "الموقع",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 243,
                        text: "",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 122.8,
                        text: "فيس بوك",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 243,
                        text: "",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 122.8,
                        text: "ملاحظة",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 243,
                        text: "",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AbuteUsWidget(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 1, 60, 106),
                            Color.fromARGB(255, 41, 162, 186),
                            Color.fromARGB(255, 1, 60, 106),
                          ]),
                        ),
                        width: 122.8,
                        text: "",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 1, 60, 106),
                          Color.fromARGB(255, 41, 162, 186),
                          Color.fromARGB(255, 1, 60, 106),
                        ]),
                      ),
                      child: const Center(
                        child: Text(
                          "الشركة المطورة",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/image/namaa.png",
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "نماء لتطوير البرمجيات",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 1, 60, 106),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "+90 538 890 63 77",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 1, 60, 106),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
