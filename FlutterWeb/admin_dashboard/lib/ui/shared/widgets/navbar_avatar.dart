// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipOval(
        child: Container(
          child: Image.network(
            'https://media.licdn.com/dms/image/D4D03AQFKLy_DzDFeRA/profile-displayphoto-shrink_800_800/0/1699617510285?e=1707350400&v=beta&t=H2xDuXGy7X-1K4YDiIYipPyKVTE--WukRcKTF389e8o',
          ),
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
