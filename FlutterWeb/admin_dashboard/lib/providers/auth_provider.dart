// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    //TODO: HTTP IStek
    this._token = 'işsfdkşsakfdşaskfşksfşkasf';
    LocalStorage.prefs.setString('token', this._token!);

    print('JWT yi saklayın: $_token');

    //TODO: Kontrol paneline git

    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: Backende gidip token in doğru olup olmadığını kontrol edin
    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}