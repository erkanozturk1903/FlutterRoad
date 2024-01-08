import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it_done/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [
    Item(name: 'Buy milk'),
    Item(name: 'Buy eggs'),
    Item(name: 'Buy bread'),
  ];

  static SharedPreferences? _sharedPreferences;
  List<String> _itemsAsString = [];

  void toogleStatus(int index) {
    _items[index].toggleStatus();
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Item(name: title));
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  //Shared Pref Methods

  Future<void> createSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveItemsToSharedPref(List<Item> items) async {
    _itemsAsString.clear();

    for (var item in items) {
      _itemsAsString.add(json.encode(item.toMap()));
    }
    _sharedPreferences?.setStringList('toDoData', _itemsAsString);
  }

  void loadItemsFromSharedPref() {
    List<String>? tempList =
        _sharedPreferences!.getStringList('toDoData') ?? [];
    _items.clear();
    for (var item in tempList) {
      _items.add(Item.fromMap(json.decode(item)));
    }
  }
}
