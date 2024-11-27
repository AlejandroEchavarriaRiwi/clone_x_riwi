import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Messages Page',
          style: TextStyle(fontSize: 24, color: Colors.white), 
        ),
      ),
    );
  }
}
