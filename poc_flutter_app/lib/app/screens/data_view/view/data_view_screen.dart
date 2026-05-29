import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_app/app/screens/data_view/controller/data_view_controller.dart';

class DataViewScreen extends ConsumerWidget {
  const DataViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(dataviewControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('DataView Screen')),

      body: Column(
        children: [
          TextButton(child: const Text('Set'), onPressed: () {
            controller.setData();
          }),
          TextButton(child: const Text('Get'), onPressed: () {
            controller.getData();
          }),
          TextButton(child: const Text('Exist'), onPressed: () {
            controller.contains();
          }),
          TextButton(child: const Text('Remove'), onPressed: () {
            controller.remove();
          }),
          ],
      ),
    );
  }
}
