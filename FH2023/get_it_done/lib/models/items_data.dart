import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get_it_done/models/item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [
    Item(name: 'Buy milk'),
    Item(name: 'Buy eggs'),
    Item(name: 'Buy bread'),
  ];

  void toogleStatus(int index) {
    _items[index].toggleStatus();
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Item(name: title));
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
}
