// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_restapi_todo_app/constants/url.dart';

class AuthProvider extends ChangeNotifier {
  // Base Url
  final requestBaseUrl = AppUrl.baseUrl;

  //Setter
  bool _isLoading = false;
  String _resMessage = "";

  //Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

//REGISTER USER
  void registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/users/";
    final body = {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
    };
    print(body);

    try {
      http.Response response =
          await http.post(Uri.parse(url), body: json.encode(body));
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        print(res);
        _isLoading = false;
        _resMessage = "Registration Successful";
        notifyListeners();
      } else {
        final res = json.decode(response.body);
        print(res);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "No Internet Connection";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
      print(":::: $e");
    }
  }

  //LOGIN USER
  void loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/users/login";
    final body = {
      "email": email,
      "password": password,
    };
    print(body);

    try {
      http.Response response =
          await http.post(Uri.parse(url), body: json.encode(body));
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);
        print(res);
        _isLoading = false;
        _resMessage = "Login Successful";
        notifyListeners();
      } else {
        final res = json.decode(response.body);

        _resMessage = res['message'];

        print(res);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "No Internet Connection";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
      print(":::: $e");
    }
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}
