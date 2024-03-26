// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/common/language/controller/language_controller.dart';
import 'package:midsatech_mobile/common/language/language_widget.dart';
import 'package:midsatech_mobile/common/widget/button_widget.dart';
import 'package:midsatech_mobile/pages/main/home.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF021734),
      body: SafeArea(
        child: GetBuilder<LocalizationController>(
          builder: (localizationsController) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(5),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),

                  Center(
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        'assets/app_logo.jpeg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Center(
                    child: Text(
                      ' Midsatech-W',
                      style: TextStyle(
                          color: Colors.deepOrange.shade400,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'selected_language'.tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 1),
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => LanguageWidget(
                            languageModel:
                                localizationsController.languages[index],
                            localizationController: localizationsController,
                            index: index)),
                  ),

                  const SizedBox(height: 10),
                  //TODO: Sign up button
                  Center(
                    child: appButton(
                        buttonName: "you_can_change_language".tr,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
