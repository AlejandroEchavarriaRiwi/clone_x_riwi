import 'package:flutter/material.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Vista de Siguiendo',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
