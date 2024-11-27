import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Notifications Page',
          style: TextStyle(fontSize: 24, color: Colors.white), 
        ),
      ),
    );
  }
}
