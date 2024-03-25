import 'package:flutter/material.dart';
import 'package:midsatech_mobile/common/language/controller/language_controller.dart';
import 'package:midsatech_mobile/common/language/model/app_constants.dart';
import 'package:midsatech_mobile/common/language/model/language_model.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  const LanguageWidget({
    super.key,
    required this.languageModel,
    required this.localizationController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(Locale(
          AppConstants.languages[index].languageCode,
          AppConstants.languages[index].countryCode,
        ));
        localizationController.setSelectedLanguageIndex(index);
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        //padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    languageModel.imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            localizationController.selectedLanguageIndex == index
                ? Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: -92,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 30,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
