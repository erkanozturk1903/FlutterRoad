import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:midsatech_mobile/common/language/controller/language_controller.dart';
import 'package:midsatech_mobile/common/language/model/app_constants.dart';
import 'package:midsatech_mobile/common/utils/app_routes.dart';
import 'package:midsatech_mobile/common/utils/messages.dart';
import 'package:midsatech_mobile/firebase_options.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/common/utils/dep.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Map<String, Map<String, String>> _languages = await dep.init();
  runApp(MyApp(
    languages: _languages,
  ));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;

  const MyApp({Key? key, required this.languages}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizationController) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          locale: localizationController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode,
              AppConstants.languages[0].countryCode),
          initialRoute: RouteHelper.getSplashRoute(),
          getPages: RouteHelper.routes,
          //home: const SplashScreen(),
        );
      },
    );
  }
}
