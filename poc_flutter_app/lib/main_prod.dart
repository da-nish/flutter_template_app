

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_app/app/application.dart';
import 'package:poc_flutter_app/app/core/base/dependency_setup.dart';
import 'package:poc_flutter_app/env/environment_data.dart';

Future<void> main() async {
    try {
    await dotenv.load(fileName: 'lib/env/.env.production');
  } catch (error) {
    throw Exception("Could not load environment: $error");
  }
  Environment env = Environment.initialize(EnvironmentType.production);
  getIt.registerSingleton<Environment>(env);
  runApp(ProviderScope(child: const MyApp()));
}