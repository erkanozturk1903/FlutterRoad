import 'package:flutter/material.dart';
import 'package:multistore_app/dashboard_components/edit_business.dart';
import 'package:multistore_app/dashboard_components/manage_product.dart';
import 'package:multistore_app/dashboard_components/my_store.dart';
import 'package:multistore_app/dashboard_components/supp_balance.dart';
import 'package:multistore_app/dashboard_components/supp_orders.dart';
import 'package:multistore_app/dashboard_components/supp_statics.dart';
import 'package:multistore_app/widget/appbar_widget.dart';

List<String> label = [
  "my store",
  "orders",
  "edit profile",
  "manage products",
  "balance ",
  "statistics",
];

List<IconData> icon = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.bar_chart,
];

List<Widget> pages = const [
  MyStore(),
  SupplierOrders(),
  EditBusiness(),
  ManageProduct(),
  SuppliersBalance(),
  SuppliersStatics()
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const AppBartitle(title: 'Dashboard'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/welcome_screen',
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: GridView.count(
            mainAxisSpacing: 50,
            crossAxisSpacing: 50,
            crossAxisCount: 2,
            children: List.generate(
              6,
              (index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pages[index],
                    ),
                  );
                },
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.purpleAccent.shade200,
                  color: Colors.blueGrey.withOpacity(0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        icon[index],
                        size: 50,
                        color: Colors.yellowAccent,
                      ),
                      Text(
                        label[index].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          fontFamily: 'Acme',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
