import 'package:flutter/material.dart';
import 'package:hseapp/pages/clients/clients.dart';
import 'package:hseapp/pages/drivers/drivers.dart';
import 'package:hseapp/pages/overview/overview.dart';
import 'package:hseapp/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(const OverviewPage());
    case driversPageRoute:
      return _getPageRoute(const DriversPage());
    case clientsPageRoute:
      return _getPageRoute(const ClientsPage());
    default:
      return _getPageRoute(const OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
