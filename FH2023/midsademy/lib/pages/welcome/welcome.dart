// ignore_for_file: sized_box_for_whitespace

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:midsademy/pages/welcome/notifier/welcome_notifier.dart';
import 'package:midsademy/pages/welcome/widgets.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({Key? key}) : super(key: key);
  final PageController _controller = PageController();

  //int dotsIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print("my dots value is $dotsIndex");
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //TODO: Showing our there welcome pages
                PageView(
                  onPageChanged: (value) {
                    print("my value is $value");
                    //dotsIndex = value;
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    //TODO: First Page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/reading.png",
                      title: "Welcome to Midsademy",
                      subTitle:
                          "We are happy to have you here. Let's get started!",
                      index: 1,
                      context: context,
                    ),
                    //TODO: Second Page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/man.png",
                      title: "Connect With Everyone",
                      subTitle:
                          "Always keep in touch with your tutor and friends. Let's get connected!",
                      index: 2,
                      context: context,
                    ),
                    //TODO: Third Page
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/boy.png",
                        title: "Always Facilitate Learning",
                        subTitle:
                            "We are here to make learning easy and fun for you. Let's get started!",
                        index: 3,
                        context: context),
                  ],
                ),
                //TODO: For Showing dots

                Positioned(
                  bottom: 50,
                  //left: 20,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: index,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
