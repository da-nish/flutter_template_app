import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_flutter_app/app/application.dart';
import 'package:poc_flutter_app/app/core/base/dependency_setup.dart';
import 'package:poc_flutter_app/app/screens/profile_screen.dart';
import 'package:poc_flutter_app/env/environment_data.dart';
import 'package:poc_flutter_app/l10n/app_localizations.dart';

import '../routes/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    Environment env = getIt<Environment>();
    debugPrint("=====> $env");
    
    return Scaffold(
      appBar: AppBar(title: const Text('Home Hub')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: const Text('English'),
                          onPressed: () {
                            ref.read(localeProvider.notifier).state =
                            const Locale('en');
                          },
                        ),
                        TextButton(
                          child: const Text('Hindi'),
                          onPressed: () {
                            ref.read(localeProvider.notifier).state =
                            const Locale('hi');
                          },
                        ),
                        TextButton(
                          child: const Text('kannada'),
                          onPressed: () {
                            ref.read(localeProvider.notifier).state =
                            const Locale('kn');
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.helloUser("Danish"), style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    SizedBox(height: 20,)
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () => appRouter.push(AppRoutes.login),
              // goRouter.push(AppRoutes.login),
              child: const Text('Login Screen'),
            ),ElevatedButton(
              onPressed: () => appRouter.push(AppRoutes.whatnextScreen),
              // goRouter.push(AppRoutes.login),
              child: const Text('Whatsnext Screen'),
            ),
            ElevatedButton(
              onPressed: () =>
                  appRouter.push(AppRoutes.login1, extra: "111112"),
              // goRouter.push(AppRoutes.login),
              child: const Text('Login Screen 1'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => appRouter.push(AppRoutes.listview),
              // goRouter.push(AppRoutes.login),
              child: const Text('Listview'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await context.push(
                  AppRoutes.profile,
                  extra: User(name: 'VVVV', age: '25'),
                );
                debugPrint("result: $result");
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
            ElevatedButton(
              onPressed: () => context.push(AppRoutes.dataViewScreen),
              child: const Text('Data view Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
