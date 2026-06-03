import 'package:flutter/material.dart';


  Future<String> showCountryBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Select Country',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                ListTile(
                  leading: const Icon(Icons.male),
                  title: const Text('India'),
                  onTap: () {
                    Navigator.pop<String>(context, "India");
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.female),
                  title: const Text('USA'),
                  onTap: () {
                    Navigator.pop<String>(context, "USA");
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Other'),
                  onTap: () {
                    Navigator.pop<String>(context, "Other");
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    return result ?? "";
  }