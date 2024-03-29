// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/pages/auth/login_screen.dart';
import 'package:midsatech_mobile/pages/main/dashboard.dart';
import 'package:midsatech_mobile/pages/main/events/events.dart';
import 'package:midsatech_mobile/pages/main/human_resource.dart';
import 'package:midsatech_mobile/pages/main/profile.dart';
import 'package:midsatech_mobile/pages/main/safety.dart';
import 'package:midsatech_mobile/pages/screens/my_drawer_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } /* else if (currentPage == DrawerSections.human) {
      container = HumanPage();
    }  */
    else if (currentPage == DrawerSections.safety) {
      container = SafetyPage();
    } else if (currentPage == DrawerSections.event) {
      container = EventPage();
    } /*  else if (currentPage == DrawerSections.profile) {
      container = ProfilePage();
    } */
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        //automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'home'.tr,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LanguageSelectorDialog();
                },
              );
            },
            icon: const Icon(Icons.language),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [MyHeaderDrawer(), MyDrawerList()],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "dashboard".tr, Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          /*  menuItem(2, "human_resource".tr, Icons.supervised_user_circle_rounded,
              currentPage == DrawerSections.human ? true : false), */
          menuItem(3, "work_safety".tr, Icons.workspaces_sharp,
              currentPage == DrawerSections.safety ? true : false),
          menuItem(4, "event".tr, Icons.calendar_month,
              currentPage == DrawerSections.event ? true : false),
          /*  menuItem(5, "profile".tr, Icons.feedback_outlined,
              currentPage == DrawerSections.profile ? true : false), */
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.human;
            } else if (id == 3) {
              currentPage = DrawerSections.safety;
            } else if (id == 4) {
              currentPage = DrawerSections.event;
            } else if (id == 5) {
              currentPage = DrawerSections.profile;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  human,
  safety,
  event,
  profile,
}

class LanguageSelectorDialog extends StatelessWidget {
  const LanguageSelectorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Language'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlagButton(
            countryCode: 'en',
            onPressed: () {
              changeLanguage(context, 'en', 'US');
            },
          ),
          FlagButton(
            countryCode: 'fi',
            onPressed: () {
              changeLanguage(context, 'fi', 'FI');
            },
          ),
          FlagButton(
            countryCode: 'tr',
            onPressed: () {
              changeLanguage(context, 'tr', 'TR');
            },
          ),
        ],
      ),
    );
  }

  void changeLanguage(
      BuildContext context, String languageCode, String countryCode) {
    Get.updateLocale(Locale(languageCode, countryCode));
    Navigator.pop(context);
  }
}

class FlagButton extends StatelessWidget {
  final String countryCode;
  final VoidCallback onPressed;

  const FlagButton(
      {Key? key, required this.countryCode, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Image.asset(
        'assets/lang/${countryCode}.jpg',
        width: 32,
        height: 32,
      ),
    );
  }
}
