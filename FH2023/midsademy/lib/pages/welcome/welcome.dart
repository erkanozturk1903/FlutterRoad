import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

            //height: 300,
            PageView(
              children: [
               Container(
                 width: 345,
                  height: 345,
                 child: Image.asset('assets/images/reading.png'),
               )
              ],

          ),
          const Positioned(
            bottom: 200,
            left: 20,
            child: Text('Widget One'),
          ),
          const Positioned(
            left: 200,
            top: 100,
            child: Text(
              'Widget One',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
