import 'package:admin_dashboard/ui/shared/sidedar.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffEDF1F2),
        body: Row(
          children: [
            if (size.width >= 700) const Sidebar(),
            Expanded(
              child: Column(
                children: [
                  //Navbar
                  const Navbar(),

                  //View
                  Expanded(
                    child: child,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
