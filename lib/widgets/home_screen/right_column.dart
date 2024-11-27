import 'package:flutter/material.dart';

class RightColumn extends StatelessWidget {
  const RightColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Suggested Widgets',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('User 1'),
                  subtitle: Text('Suggested content for user 1'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('User 2'),
                  subtitle: Text('Suggested content for user 2'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('User 3'),
                  subtitle: Text('Suggested content for user 3'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
