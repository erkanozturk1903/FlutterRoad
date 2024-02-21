import 'package:flutter/material.dart';

class HomeRiverpod extends ChangeNotifier {
  List<String> campaigns = [
    'assets/images/im_campaigns.png',
    'assets/images/im_campaigns.png',
    'assets/images/im_campaigns.png',
  ];

  int campaignsCurrentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  void setCampaignsCurrentIndex(int newPageValue) {
    campaignsCurrentIndex = newPageValue;
    notifyListeners();
  }
}
