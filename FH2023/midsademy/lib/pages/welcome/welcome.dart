// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:midsademy/pages/welcome/widgets.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //height: 300,
          PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: [
              //TODO: First Page
              appOnboardingPage(
                _controller,
                imagePath: "assets/images/reading.png",
                title: "Welcome to Midsademy",
                subTitle: "We are happy to have you here. Let's get started!",
                index:1

              ),
              //TODO: Second Page
              appOnboardingPage(
                  _controller,
                  imagePath: "assets/images/man.png",
                  title: "Connect With Everyone",
                  subTitle: "Always keep in touch with your tutor and friends. Let's get connected!",
                  index:2,
              ),
              //TODO: Third Page
              appOnboardingPage(
                _controller,
                  imagePath: "assets/images/boy.png",
                  title: "Always Facilitate Learning",
                  subTitle: "We are here to make learning easy and fun for you. Let's get started!",
                  index:3
              ),

            ],
          ),
          const Positioned(
            bottom: 200,
            left: 20,
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
