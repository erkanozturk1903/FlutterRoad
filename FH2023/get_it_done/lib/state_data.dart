import 'package:flutter/material.dart';

class StateData extends ChangeNotifier {
  String sehir = "Ankara";

  void sehirDegistir(String yeniSehir) {
    sehir = yeniSehir;
    notifyListeners();
  }
}
