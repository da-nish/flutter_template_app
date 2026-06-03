

import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/basic_profile_screen.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';
import 'package:ps_whatsnext/search_option_list/search_screen.dart';

class InbuiltSearchScreen extends StatefulWidget {
  final SectionModel section;
  final FormController formController;

  const InbuiltSearchScreen({
    super.key,
    required this.section,
    required this.formController,
  });

  @override
  State<InbuiltSearchScreen> createState() =>
      _InbuiltSearchScreenState();
}

class _InbuiltSearchScreenState
    extends State<InbuiltSearchScreen> {
  String? selectedValue;

  String get value => widget.formController.getValue(widget.section.id);


  String getValue(){
    String value = widget.formController.getValue(widget.section.id);
    if(value.isNotEmpty){
      return value;
    }
    final item = widget.section.content.first;

    return 'Select ${item['title']}';                   
  }

  @override
  Widget build(BuildContext context) {
    if(widget.section.content.isEmpty){
      return SizedBox.shrink();

    }
    final item = widget.section.content.first;

    return FormField<String>(
      initialValue: selectedValue ?? "",
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: !widget.section.required ? null : (v) {
        if ((selectedValue ?? "").isEmpty) {
          return 'You must accept the terms';
        }
        return null;
      },
      builder: (field) {
        return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: InkWell(
          onTap: () => redirect(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                field.hasError && value.isEmpty
                      ? Colors.red.shade300
                      : Colors.grey.shade300,
              ),
              borderRadius:
                  BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        getValue(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                )
              ],
            ),
          ),
        ),
      );
      }
    );
  }

  Future<void> redirect(
    BuildContext context,
  ) async {
    dynamic result;

    result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DynamicSearchScreen(
          title: 'Address',
          placeholder: 'Address Search',
          endpoint: '/search-item',
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedValue = result.toString();
        widget.formController.updateValue(widget.section.id, selectedValue);
      });
    }
  }
}