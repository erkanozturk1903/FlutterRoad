import 'package:admin_dashboard/controllers/my_controller.dart';
import 'package:admin_dashboard/models/customer.dart';

import 'package:get/get.dart';

class CustomersController extends MyController {
  List<Customer> customers = [];

  CustomersController();

  @override
  void onInit() {
    super.onInit();
    Customer.dummyList.then((value) {
      customers = value;
      update();
    });
  }

  void goToDashboard() {
    Get.toNamed('/dashboard');
  }
}
