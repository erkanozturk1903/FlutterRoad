// ignore_for_file: prefer_const_declarations, body_might_complete_normally_nullable

import 'dart:convert';

import 'package:deneme_test_api/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<UserModel?> fetchUser(String? pKullaniciAdi, String? pSifre) async {
    Map<String, dynamic> json = {
      'pKullaniciAdi': pKullaniciAdi,
      'pSifre': pSifre,
    };
    final String url =
        "http://testwlcrm.iski.gov.tr/CrmArizalari/resources/CrmAriza/Login";
    var res = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'x-api-key': '253bee30eaf21c03570c4947dd9727de'
      },
      body: json,
    );
    if (res.statusCode == 200) {
      var jsonBody = UserModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      print('İstek Başarısız Oldu. Hata Kodu: ${res.statusCode}');
    }
  }
}
