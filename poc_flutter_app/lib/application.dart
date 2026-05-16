import 'package:flutter/material.dart';
import 'package:poc_flutter_app/core/connection/internet_check.dart';
import 'package:poc_flutter_app/routes/app_router.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: appRouter,
      builder: (context, child) => GlobalInternetListener(child: child!),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}