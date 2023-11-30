import 'package:bases_web/locator.dart';
import 'package:bases_web/services/navigator_service.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return (constraints.maxWidth > 520)
            ? _TableDesktopMenu()
            : _MobileMenu();
      },
    );
  }
}

class _TableDesktopMenu extends StatelessWidget {
  const _TableDesktopMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
            text: 'Stateful',
            onPressed: () {
              // Navigator.pushNamed(context, '/stateful');
              locator<NavigationService>().navigateTo("/stateful");
            },
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
            text: 'Provider',
            onPressed: () {
              //Navigator.pushNamed(context, '/provider');
              locator<NavigationService>().navigateTo("/provider");
            },
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
            text: 'Page404',
            onPressed: () {
              //Navigator.pushNamed(context, '/abc123');
              locator<NavigationService>().navigateTo("/abc123");
            },
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFlatButton(
            text: 'Stateful',
            onPressed: () {
              // Navigator.pushNamed(context, '/stateful');
              locator<NavigationService>().navigateTo("/stateful");
            },
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
            text: 'Provider',
            onPressed: () {
              //Navigator.pushNamed(context, '/provider');
              locator<NavigationService>().navigateTo("/provider");
            },
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
            text: 'Page404',
            onPressed: () {
              //Navigator.pushNamed(context, '/abc123');
              locator<NavigationService>().navigateTo("/abc123");
            },
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
