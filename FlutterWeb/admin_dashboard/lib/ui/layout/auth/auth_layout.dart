import 'package:admin_dashboard/ui/layout/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layout/auth/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        //Desktop
        _DesktopBody(child: child)
        //Mobile

        //LinksBar
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.red,
      child: Row(
        children: [
          //Background
          BacgroundTwitter(),

          //View Container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomTitle(),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: child,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
