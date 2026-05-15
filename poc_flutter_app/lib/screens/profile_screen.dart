import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class User{
  final String name;
  final String age;

  User({required this.name, required this.age});
}


class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            TextButton(
            child: const Text('Back'),
            onPressed: () {
            context.pop('Hello from Profile screen');
            },
            ),
            SizedBox(height: 16),
            Text(user.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('john.doe@example.com', style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
