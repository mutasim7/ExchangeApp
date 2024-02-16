import 'dart:convert';

import 'package:currency_converter/model/ads_model.dart';
import 'package:currency_converter/providers/api_links.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdsProvider with ChangeNotifier {
  List<AdsModel> adsList = [];
  int id_Office_forAd = 1;
  Future<List<AdsModel>> gatAllAds() async {
    try {
      final response = await http
          .get(Uri.parse("${ApiLinks.linkgetAllAds}/$id_Office_forAd"));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        adsList.clear();
        for (var item in jsonData['ads']) {
          adsList.add(AdsModel.fromjson(item));
        }
        return adsList;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
    return [];
  }
}
