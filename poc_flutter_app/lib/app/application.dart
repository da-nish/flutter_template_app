import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:poc_flutter_app/app/core/connection/internet_check.dart';
import 'package:poc_flutter_app/app/routes/app_router.dart';
import 'package:poc_flutter_app/l10n/app_localizations.dart';


final localeProvider =
    StateProvider<Locale>((ref) {
  return const Locale('en');
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: appRouter,
      builder: (context, child) => GlobalInternetListener(child: child!),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: const [
        //flutter gen-l10n
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('kn'),
      ],
      locale: locale,

    );
  }
}