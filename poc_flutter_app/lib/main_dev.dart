

import 'package:flutter/material.dart';
import 'package:poc_flutter_app/core/base/dependency_setup.dart';
import 'package:poc_flutter_app/core/env/environment_data.dart';
import 'package:poc_flutter_app/application.dart';

void main() {
  Environment env = Environment.initialize(EnvironmentType.development);
  getIt.registerSingleton<Environment>(env);
  runApp(const MyApp());
}