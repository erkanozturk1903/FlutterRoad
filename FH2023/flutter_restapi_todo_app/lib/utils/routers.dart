import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageNavigator {
  BuildContext? context;

  PageNavigator({this.context});

  //Navigator to a next page

  Future nextPage({Widget? page}) async {
    await Navigator.push(
      context!,
      CupertinoPageRoute(builder: ((context) => page!)),
    );
  }

  void nextPageOnly({Widget? page}) {
    Navigator.pushAndRemoveUntil(
      context!,
      MaterialPageRoute(builder: (context) => page!),
      (route) => false,
    );
  }
}
