import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Search Page',
          style: TextStyle(fontSize: 24, color: Colors.white), 
        ),
      ),
    );
  }
}
