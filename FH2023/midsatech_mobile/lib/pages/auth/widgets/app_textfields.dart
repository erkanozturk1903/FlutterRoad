import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/common/widget/app_shadow.dart';
import 'package:midsatech_mobile/common/widget/image_widgets.dart';
import 'package:midsatech_mobile/common/widget/text_widgets.dart';

Widget appTextField({
  String text = "",
  String iconName = "",
  String hintText = "type_in_your_info",
  bool obscureText = false,
  TextEditingController? controller,
}) {
  return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text14Normal(text: text),
          const SizedBox(height: 5),
          Container(
            width: 325,
            height: 50,
            //color: Colors.red,
            decoration: appBoxDecorationTextField(),
            //TODO: Row contains icon and text field
            child: Row(
              children: [
                //TODO: For Showing icons
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: appImage(
                    imagePath: iconName,
                  ),
                ),
                //TODO: For showing text field
                Container(
                  width: 260,
                  height: 50,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: hintText.tr,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      print(value);
                    },
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: obscureText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
}
