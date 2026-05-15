import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_flutter_app/screens/profile_screen.dart';

import '../routes/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Hub')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => appRouter.push(AppRoutes.login),
              // goRouter.push(AppRoutes.login),
              child: const Text('Login Screen'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await context.push(AppRoutes.profile, extra: User(name: 'VVVV', age: '25'));
                print("result: $result");
                },
              child: const Text('Profile Screen'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push(AppRoutes.settings),
              child: const Text('Settings Screen'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push(AppRoutes.dashboard),
              child: const Text('Dashboard Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
