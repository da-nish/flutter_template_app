import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/basic_profile_screen.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';
import 'package:ps_whatsnext/basic_profile/widget/country_bottomsheet.dart';
import 'package:ps_whatsnext/basic_profile/widget/gender_bottomsheet.dart';
import 'package:ps_whatsnext/basic_profile/widget/name_title_bottomsheet.dart';

class InbuiltSheetSelectionWidget extends StatefulWidget {
  final SectionModel section;
  final FormController formController;

  const InbuiltSheetSelectionWidget({
    super.key,
    required this.section,
    required this.formController,
  });

  @override
  State<InbuiltSheetSelectionWidget> createState() =>
      _InbuiltSheetSelectionWidgetState();
}

class _InbuiltSheetSelectionWidgetState
    extends State<InbuiltSheetSelectionWidget> {
  String? selectedValue;


  String get value => widget.formController.getValue(widget.section.id);

  String getValue() {
    String value = widget.formController.getValue(widget.section.id);
    if (value.isNotEmpty) {
      return value;
    }
    final item = widget.section.content.first;

    return 'Select ${item['title']}';
  }

  @override
  Widget build(BuildContext context) {
    if (widget.section.content.isEmpty) {
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
            onTap: () => _openSheet(context, item['id']),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(
                  color: field.hasError && value.isEmpty
                      ? Colors.red.shade300
                      : Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(getValue(), style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _openSheet(BuildContext context, String sheetId) async {
    dynamic result;

    switch (sheetId) {
      case 'gender_sheet_selection':
        result = await showGenderBottomSheet(context);
        break;

      case 'country_sheet_selection':
        result = await showCountryBottomSheet(context);
        break;

      case 'name_title_sheet_selection':
        result = await showNameTitleBottomSheet(context);
        break;
    }

    if (result != null) {
      setState(() {
        selectedValue = result.toString();
        widget.formController.updateValue(widget.section.id, selectedValue);
      });
    }
  }
}
