import 'package:get/get.dart';
import 'package:midsatech_mobile/common/language/language_screens.dart';
import 'package:midsatech_mobile/pages/screens/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/spalsh';
  static const String language = '/language';

  static String getInitialRoute() => "$initial";
  static String getSplashRoute() => "$splash";
  static String getLanguageRoute() => "$language";

  static List<GetPage> routes = [
    //GetPage(name: initial, page: () => null),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: language, page: () => LanguageScreen()),
  ];
}
