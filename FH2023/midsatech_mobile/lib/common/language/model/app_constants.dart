import 'package:midsatech_mobile/common/language/model/language_model.dart';

class AppConstants {
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: 'assets/images/en.jpg',
      languageCode: 'en',
      countryCode: 'US',
      languageName: 'English',
    ),
    LanguageModel(
      imageUrl: 'assets/images/fi.jpg',
      languageCode: 'fi',
      countryCode: 'FI',
      languageName: 'Finnish',
    ),
    LanguageModel(
      imageUrl: 'assets/images/tr.jpg',
      languageCode: 'tr',
      countryCode: 'TR',
      languageName: 'Turkish',
    ),
  ];
}
