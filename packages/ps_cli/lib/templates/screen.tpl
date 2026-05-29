import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_app/app/screens/{{feature_name}}/controller/{{feature_name}}_controller.dart';

class {{FeatureName}}Screen extends ConsumerWidget {
  const {{FeatureName}}Screen({super.key});

 @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(controllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('{{FeatureName}} Screen'),
      ),
      body: const Center(
        child: Text('{{FeatureName}} Screen'),
      ),
    );
  }
}