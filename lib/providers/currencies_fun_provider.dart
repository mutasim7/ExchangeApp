// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';

import 'package:currency_converter/providers/api_links.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CurrenciesfunProvider with ChangeNotifier {
  String? _updated_at_eur_usd;
  String? get get_updated_at_eur_usd => _updated_at_eur_usd;

  String? _updated_at_try_usd;
  String? get get_updated_at_try_usd => _updated_at_try_usd;

  String? _updated_at_syp_usd;
  String? get get_updated_at_syp_usd => _updated_at_syp_usd;

  String? _updated_at_try_syp;
  String? get get_updated_at_try_syp => _updated_at_try_syp;

  String? _updated_at;
  String? get get_updated_at => _updated_at;

  void updateLatestDateTime(
      String? eurUsd, String? tryUsd, String? sypUsd, String? trySyp) {
    DateTime? latestDateTime;

    // تحويل التواريخ إلى كائنات DateTime
    final eurUsdDateTime = eurUsd != null ? DateTime.parse(eurUsd) : null;
    final tryUsdDateTime = tryUsd != null ? DateTime.parse(tryUsd) : null;
    final sypUsdDateTime = sypUsd != null ? DateTime.parse(sypUsd) : null;
    final trySypDateTime = trySyp != null ? DateTime.parse(trySyp) : null;

    // قارن بين التواريخ واحتفظ بالأحدث
    if (eurUsdDateTime != null) {
      if (latestDateTime == null || eurUsdDateTime.isAfter(latestDateTime)) {
        latestDateTime = eurUsdDateTime;
      }
    }

    if (tryUsdDateTime != null) {
      if (latestDateTime == null || tryUsdDateTime.isAfter(latestDateTime)) {
        latestDateTime = tryUsdDateTime;
      }
    }

    if (sypUsdDateTime != null) {
      if (latestDateTime == null || sypUsdDateTime.isAfter(latestDateTime)) {
        latestDateTime = sypUsdDateTime;
      }
    }

    if (trySypDateTime != null) {
      if (latestDateTime == null || trySypDateTime.isAfter(latestDateTime)) {
        latestDateTime = trySypDateTime;
      }
    }

    // تحويل الوقت الأحدث إلى نص وتخزينه في _updated_at
    _updated_at = latestDateTime?.toIso8601String();
  }

  double? _eur_usd_buying;
  double? get geteur_usd_buying => _eur_usd_buying;

  double? _eur_usd_sold;
  double? get geteur_usd_sold => _eur_usd_sold;

  double? _try_usd_buying;
  double? get gettry_usd_buying => _try_usd_buying;

  double? _try_usd_sold;
  double? get gettry_usd_sold => _try_usd_sold;

  double? _syp_usd_buying;
  double? get getsyp_usd_buying => _syp_usd_buying;

  double? _syp_usd_sold;
  double? get getsyp_usd_sold => _syp_usd_sold;

  double? _try_syp_buying;
  double? get gettry_syp_buying => _try_syp_buying;

  double? _try_syp_sold;
  double? get gettry_syp_sold => _try_syp_sold;

  Future<void> setcurrencies_usd_eur(
      {required double eur_usd_buying, required double eur_usd_sold}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('eur_usd_buying', eur_usd_buying);
    prefs.setDouble('eur_usd_sold', eur_usd_sold);
  }

  Future<void> setcurrencies_try_usd(
      {required double try_usd_buying, required double try_usd_sold}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('try_usd_buying', try_usd_buying);
    prefs.setDouble('try_usd_sold', try_usd_sold);
  }

  Future<void> setcurrencies_syp_usd(
      {required double syp_usd_buying, required double syp_usd_sold}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('syp_usd_buying', syp_usd_buying);
    prefs.setDouble('syp_usd_sold', syp_usd_sold);
  }

  Future<void> setcurrencies_syp_try(
      {required double try_syp_buying, required double try_syp_sold}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('try_syp_buying', try_syp_buying);
    prefs.setDouble('try_syp_sold', try_syp_sold);
  }

  Future<void> getcurrencies_usd_eur_prefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _eur_usd_buying = prefs.getDouble('eur_usd_buying');
    _eur_usd_sold = prefs.getDouble('eur_usd_sold');
    notifyListeners();
  }

  Future<void> getcurrencies_try_usd_prefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _try_usd_buying = prefs.getDouble('try_usd_buying');
    _try_usd_sold = prefs.getDouble('try_usd_sold');
    notifyListeners();
  }

  Future<void> getcurrencies_syp_usd_prefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _syp_usd_buying = prefs.getDouble('syp_usd_buying');
    _syp_usd_sold = prefs.getDouble('syp_usd_sold');
    notifyListeners();
  }

  Future<void> getcurrencies_syp_try_prefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _try_syp_buying = prefs.getDouble('try_syp_buying');
    _try_syp_sold = prefs.getDouble('try_syp_sold');
    notifyListeners();
  }

  int id_Office = 1;
  Future<void> getcurrencies_usd_eur() async {
    try {
      final response = await http
          .get(Uri.parse("${ApiLinks.linkgetcurrencies_usd_eur}/$id_Office"));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        double eur_usd_buying = double.parse(
            jsonData['currencies_eur_usd']['eur_usd_buying'].toString());
        double eur_usd_sold = double.parse(
            jsonData['currencies_eur_usd']['eur_usd_sold'].toString());
        _updated_at_eur_usd = jsonData['currencies_eur_usd']['updated_at'];

        await setcurrencies_usd_eur(
            eur_usd_buying: eur_usd_buying, eur_usd_sold: eur_usd_sold);
        await getcurrencies_usd_eur_prefs();

        print(eur_usd_buying);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> getcurrencies_syp_usd() async {
    try {
      final response = await http
          .get(Uri.parse("${ApiLinks.linkgetcurrencies_syp_usd}/$id_Office"));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        double syp_usd_buying = double.parse(
            jsonData['currencies_syp_usd']['syp_usd_buying'].toString());
        double syp_usd_sold = double.parse(
            jsonData['currencies_syp_usd']['syp_usd_sold'].toString());
        _updated_at_syp_usd = jsonData['currencies_syp_usd']['updated_at'];

        await setcurrencies_syp_usd(
            syp_usd_buying: syp_usd_buying, syp_usd_sold: syp_usd_sold);
        await getcurrencies_syp_usd_prefs();
        print(syp_usd_buying);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> getcurrencies_try_usd() async {
    try {
      final response = await http
          .get(Uri.parse("${ApiLinks.linkgetcurrencies_try_usd}/$id_Office"));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        double try_usd_buying = double.parse(
            jsonData['currencies_try_usd']['try_usd_buying'].toString());
        double try_usd_sold = double.parse(
            jsonData['currencies_try_usd']['try_usd_sold'].toString());
        _updated_at_try_usd = jsonData['currencies_try_usd']['updated_at'];

        await setcurrencies_try_usd(
            try_usd_buying: try_usd_buying, try_usd_sold: try_usd_sold);
        await getcurrencies_try_usd_prefs();
        print(try_usd_buying);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> getcurrencies_syp_try() async {
    try {
      final response = await http
          .get(Uri.parse("${ApiLinks.linkgetcurrencies_syp_try}/$id_Office"));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        double try_syp_buying = double.parse(
            jsonData['currencies_syp_try']['try_syp_buying'].toString());
        double try_syp_sold = double.parse(
            jsonData['currencies_syp_try']['try_syp_sold'].toString());
        _updated_at_try_syp = jsonData['currencies_syp_try']['updated_at'];

        await setcurrencies_syp_try(
            try_syp_buying: try_syp_buying, try_syp_sold: try_syp_sold);
        await getcurrencies_syp_try_prefs();
        print(try_syp_buying);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
      double try_syp_buying = 0;
      double try_syp_sold = 0;
      await setcurrencies_syp_try(
          try_syp_buying: try_syp_buying, try_syp_sold: try_syp_sold);
      await getcurrencies_syp_try_prefs();
    }
    notifyListeners();
  }
}
