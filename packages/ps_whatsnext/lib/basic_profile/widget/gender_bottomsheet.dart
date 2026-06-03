import 'package:flutter/material.dart';


  Future<String> showGenderBottomSheet(BuildContext context) async {
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
                  'Select Gender',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                ListTile(
                  leading: const Icon(Icons.male),
                  title: const Text('Male'),
                  onTap: () {
                    Navigator.pop<String>(context, "Male");
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.female),
                  title: const Text('Female'),
                  onTap: () {
                    Navigator.pop<String>(context, "Female");
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