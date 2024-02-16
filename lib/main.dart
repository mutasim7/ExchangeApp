import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:currency_converter/HomePage.dart';
import 'package:currency_converter/providers/ads_provider.dart';
import 'package:currency_converter/providers/currencies_fun_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CurrenciesfunProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'currency converter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Questv1",
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  @override
  Widget build(BuildContext context) {
    final currenciesfunProvider = Provider.of<CurrenciesfunProvider>(context);

    return AnimatedSplashScreen.withScreenFunction(
      splash: "assets/image/dollars.png",
      screenFunction: () async {
        FirebaseMessaging.instance.subscribeToTopic('T1');
        // إنشاء قائمة من Futures
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

        return const HomePage();
      },
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.white,
      splashIconSize: 250,
      duration: 500,
    );
  }
}
