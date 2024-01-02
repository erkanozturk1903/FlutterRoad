import 'package:flutter/material.dart';
import 'package:hseapp/constants/controllers.dart';
import 'package:hseapp/routing/router.dart';
import 'package:hseapp/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: overviewPageRoute,
    );
