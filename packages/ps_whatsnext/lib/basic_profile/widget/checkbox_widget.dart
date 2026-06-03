import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/basic_profile_screen.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';



class AppChecboxWidget extends StatefulWidget {
  final SectionModel section;
  final FormController formController;

  const AppChecboxWidget({
    super.key, 
    required this.section,
    required this.formController,
    });

  @override
  State<AppChecboxWidget> createState() => _AppChecboxWidgetState();
}

class _AppChecboxWidgetState extends State<AppChecboxWidget> {

  bool value = false;
  bool enable = true;
  String text = "";
  @override
  void initState() {
    enable = widget.section.content.first['enable'] ?? '';
    value = widget.section.content.first['value'] ?? '';
    text = widget.section.content.first['title'] ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: FormField<bool>(
        autovalidateMode: .onUserInteraction,
        initialValue: value,
        validator: (v) {
          if (value != true) {
            return 'You must accept the terms';
          }
          return null;
        },
        builder: (field) {
        return Column(
          children: [
            LabeledCheckbox(
              label: text, 
              enabled: enable,
              value: value, 
              onChanged: (v){
                setState(() {
                  value = v ?? false;
                  widget.formController.updateValue(widget.section.id, value);
                });
              }
            ),
            if(field.hasError && value==false)
            Row(
              children: [
                Text("You must accept the terms", style: TextStyle(color: Colors.red)),
              ],
            )
          ],
        );
        }
      )
    );
  }
}


class LabeledCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  final bool enabled;
  final Color? activeColor;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;

  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.enabled = true,
    this.activeColor,
    this.textStyle,
    this.disabledTextStyle,
  });

  void _handleTap() {
    if (!enabled) return;
    onChanged(!value);
    // field.didChange(value);

    // Revalidate immediately
    // field.validate();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = textStyle ?? const TextStyle(fontSize: 16);
    final dimmedStyle = disabledTextStyle ??
        baseStyle.copyWith(color: Colors.grey);

    return InkWell(
      onTap: enabled ? _handleTap : null,
      child: Row(
        crossAxisAlignment: .start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: enabled ? onChanged : null,
            activeColor: activeColor ?? Theme.of(context).primaryColor,
          ),
          Flexible(
            child: Text(
              label,
              style: enabled ? baseStyle : dimmedStyle,
            ),
          ),
        ],
      ),
    );
  }
}