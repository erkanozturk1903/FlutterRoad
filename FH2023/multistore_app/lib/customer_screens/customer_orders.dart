import 'package:flutter/material.dart';
import 'package:multistore_app/widget/appbar_widget.dart';

class CustomerOrders extends StatelessWidget {
  const CustomerOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBartitle(
          title: "CustomerOrders",
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
