

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_app/screens/listview_screen/controller/listview_controller.dart';

class ListviewWidget extends ConsumerWidget {

  const ListviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listviewControllerProvider);

     if (state.loading ) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.items.isEmpty) {
      return Center(
        child: Column(
          children: [
            Text("No items !!"),
          ],
        ),
      );
    }


    return ListView.builder(
        itemCount: state.items.length,
        itemBuilder: (context, index) {
          final item = state.items[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  item['title']![0],
                ),
              ),
              title: Text(item['title']!),
              subtitle: Text(item['subtitle']!),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${item['title']} clicked',
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
  }
}