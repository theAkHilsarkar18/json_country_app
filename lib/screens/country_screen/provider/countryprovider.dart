import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../model/countrymodel.dart';

class Countryprovider extends ChangeNotifier
{

  List<dynamic> countryJsonList = [];

  Future<void> CountryDataJsonParshing()
  async {
    String countryJsonDataInString = await rootBundle.loadString("assets/json/country.json");
    var countryJsonDecodeData = jsonDecode(countryJsonDataInString);
    countryJsonList = countryJsonDecodeData.map((e)=>CountryModel().countryFromJson(e)).toList();
    notifyListeners();
  }


}