// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_collection_literals

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/common/language/controller/language_controller.dart';
import 'package:midsatech_mobile/common/language/model/app_constants.dart';
import 'package:midsatech_mobile/common/language/model/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference);

  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  // ignore:
  Map<String, Map<String, String>> _languages = Map();
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/lang/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return _languages;
}
