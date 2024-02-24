
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:midsademy/common/widgets/app_shadow.dart';
import 'package:midsademy/common/widgets/image_widgets.dart';
import 'package:midsademy/common/widgets/text_widgets.dart';

Widget appTextField(
    {String text = "",
      String iconName = "",
      String hintText = "Type in your info",
      bool obscureText = false,
    }) {
  return Container(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text14Normal(text: text),
          SizedBox(height: 5.h),
          Container(
            width: 325.w,
            height: 50.h,
            //color: Colors.red,
            decoration: appBoxDecorationTextField(),
            //TODO: Row contains icon and text field
            child: Row(
              children: [
                //TODO: For Showing icons
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  child: appImage(
                    imagePath: iconName,
                  ),
                ),
                //TODO: For showing text field
                Container(
                  width: 260.w,
                  height: 50.h,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: hintText,
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
