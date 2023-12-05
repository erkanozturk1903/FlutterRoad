import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(
            height: 50,
          ),
          const TextSeparator(text: 'main'),
          MenuItem(
              text: 'Dashboard',
              icon: Icons.dashboard,
              onPressed: () => SideMenuProvider.closeMenu()
              //SideMenuProvider.closeMenu(),
              ),
          MenuItem(
            text: 'Kullanıcı Yönetimi',
            icon: Icons.manage_accounts,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Firma Yönetimi',
            icon: Icons.business,
            onPressed: () {},
          ),
          MenuItem(
            text: 'İnsan Kaynakları Yönetimi',
            icon: Icons.people,
            onPressed: () {},
          ),
          MenuItem(
            text: 'İş Güvenliği Yönetimi',
            icon: Icons.engineering,
            onPressed: () {},
          ),
          MenuItem(
            text: 'İş Sağlığı Yönetimi',
            icon: Icons.health_and_safety,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Döküman Yönetimi',
            icon: Icons.bookmark,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Mail Yönetimi',
            icon: Icons.mail,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Ajanda Yönetimi',
            icon: Icons.event,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Çıkış',
            icon: Icons.exit_to_app,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 12, 19, 32),
            Color.fromARGB(255, 7, 19, 38),
          ],
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      );
}
