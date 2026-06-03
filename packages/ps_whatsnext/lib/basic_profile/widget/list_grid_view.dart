
import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/basic_profile_screen.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';

class GridSelectionWidget extends StatefulWidget {
  final SectionModel section;
  final FormController formController;

  const GridSelectionWidget({
    super.key,
    required this.section,
    required this.formController,
    });

  @override
  State<GridSelectionWidget> createState() =>
      _GridSelectionWidgetState();
}

class _GridSelectionWidgetState
    extends State<GridSelectionWidget> {

  String selectedValue = "";
  
  String get value => widget.formController.getValue(widget.section.id);

  String? getSelectedId(){
    String value = widget.formController.getValue(widget.section.id);
    if(value.isNotEmpty){
      return value;
    }
    return null;          
  }

  @override
  void initState() {

    for(final item in widget.section.content){
      if(item["prefill"] ?? false){
        widget.formController.updateValue(widget.section.id, item["id"]);
        return;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: selectedValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: !widget.section.required ? null : (v) {
        if ((getSelectedId()??"").isEmpty) {
          return 'You must accept the terms';
        }
        return null;
      },
      builder: (field) {
        return Column(
          children: [
            GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.section.content.length,
                  padding: EdgeInsets.zero,
                  gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2,
                  ),
                  itemBuilder: (_, index) {
            final option = widget.section.content[index];
            
            final isSelected =
                getSelectedId() == option['id'];
                
            final selectColor =
                true == (option['valid']??false) ? Colors.green : Colors.red;
            
            return GestureDetector(
              onTap: option['enable']
                  ? () {
                      setState(() {
                          widget.formController.updateValue(widget.section.id,  option['id']);
                          selectedValue =  option['id'];
                      });
                    }
                  : null,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? selectColor
                        : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text(
                      option['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if((option['subtitle'] ?? '').isNotEmpty)
                    Text(
                      option['subtitle'],
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
                  },
                ),
                if (field.hasError && selectedValue.isEmpty)
                Row(
                  children: [
                    Text("Type select required", style: TextStyle(color: Colors.red)),
                  ],
                )
          ],
        );
      }
    );
  }
}


class ListSelectionWidget extends StatefulWidget {
  final SectionModel section;
  final FormController formController;

  const ListSelectionWidget(
    {super.key, 
      required this.section, 
      required this.formController,
  });

  @override
  State<ListSelectionWidget> createState() =>
      _ListSelectionWidgetState();
}

class _ListSelectionWidgetState
    extends State<ListSelectionWidget> {
  // String? _selectedId;

  String? getSelectedId(){
    String value = widget.formController.getValue(widget.section.id);
    if(value.isNotEmpty){
      return value;
    }
    return null;          
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.section.content.map<Widget>((item) {
        final bool isSelected =
            getSelectedId() == item['id'];

        final bool isEnabled =
            item['enable'] ?? true;

        final bool isValid =
            item['valid'] ?? true;

        final selectColor =
            true == (item['valid']??false) ? Colors.green : Colors.red;

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: isEnabled
                ? () {
                    setState(() {
                      widget.formController.updateValue(widget.section.id, item['id']);
                    });
                  }
                : null,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? selectColor
                      : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
                color: isEnabled
                    ? (isSelected
                        ? Colors.blue.shade50
                        : Colors.white)
                    : Colors.grey.shade100,
              ),
              child: ListTile(
                leading: Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected
                      ? Colors.blue
                      : Colors.grey,
                ),
                title: Text(
                  item['title'] ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isEnabled
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                subtitle: item['subtitle'] == null ? null : Text(
                  item['subtitle'] ?? '',
                  style: TextStyle(
                    color: isEnabled
                        ? Colors.black54
                        : Colors.grey,
                  ),
                ),
                trailing: !isValid
                    ? const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.orange,
                      )
                    : null,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

