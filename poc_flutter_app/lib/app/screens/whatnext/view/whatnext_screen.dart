import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ps_whatsnext/json/whatsnext_steps.dart';
import 'package:ps_whatsnext/whats_next/workflow_response.dart';
import 'package:ps_whatsnext/whats_next/workflow_screen.dart';

class WhatnextScreen extends ConsumerWidget {
  const WhatnextScreen({super.key});

 @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(controllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Whatnext Screen'),
      ),
      body: WorkflowScreen(response: WorkflowResponse.fromJson(whatsNextSteps))
    );
  }
}