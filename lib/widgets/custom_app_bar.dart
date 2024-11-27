import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.purple,
          child: Text(
            'A',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      title: const FaIcon(
        FontAwesomeIcons.xTwitter,
        color: Colors.white,
        size: 24,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Acción para ajustes
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
