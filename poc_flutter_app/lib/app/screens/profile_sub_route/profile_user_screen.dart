import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile User')),
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

            SizedBox(height: 8),
            Text('john.doe@example.com', style: TextStyle(fontSize: 16, color: Colors.grey)),
            TextButton(
            child: const Text('Profile User'),
            onPressed: () {
            
            },
            ),
            TextButton(
            child: const Text('Profile Admin'),
            onPressed: () {
            
            },
            ),
          ],
        ),
      ),
    );
  }
}
