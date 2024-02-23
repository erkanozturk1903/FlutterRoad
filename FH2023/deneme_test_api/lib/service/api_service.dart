import 'dart:convert';

import 'package:deneme_test_api/model/login_request_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'x-api-key': '253bee30eaf21c03570c4947dd9727de'
    };

    var url =
        "http://testwlcrm.iski.gov.tr/CrmArizalari/resources/CrmAriza/Login";
    var response = await client.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(
        model.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
