

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_app/application.dart';
import 'package:poc_flutter_app/core/base/dependency_setup.dart';
import 'package:poc_flutter_app/core/env/environment_data.dart';

void main() {
  Environment env = Environment.initialize(EnvironmentType.staging);
  getIt.registerSingleton<Environment>(env);
  runApp(ProviderScope(child: const MyApp()));
}