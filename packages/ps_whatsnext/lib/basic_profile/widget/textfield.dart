import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/basic_profile_screen.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';



class TextFieldWidget extends StatefulWidget {
  final SectionModel section;
  final FormController formController;


  const TextFieldWidget(
      {super.key,
      required this.section,
      required this.formController,
      });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final emailController = TextEditingController();

  @override
  void initState() {
    emailController.text = widget.formController.getValue(widget.section.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final content = widget.section.content.first;
    // emailController.text = content['prefill'] ?? '';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AppTextField(
          // key: ValueKey(widget.section.id),
          controller: emailController,
          hintText: content['title'] ?? '-',
          labelText: content['title'] ?? '-',
          enable:  content['enable'] ?? true,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.person),

          onChanged: (value) {
            widget.formController.updateValue(widget.section.id, value);
          },
          validator: !widget.section.required ? null : (value) {
            if (value == null || value.isEmpty) {
              return content['error'] ??  'Required field';
            }
            return null;
          },
        ),
    );
  }
}


IconData getIcon(String key) {
  switch (key) {
    case 'sheild':
      return Icons.security;

    case 'info':
      return Icons.info_outline;

    case 'person':
      return Icons.person_outline;

    default:
      return Icons.help_outline;
  }
}






class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enable;

  const AppTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enable,
      // initialValue: "asdfd",
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),

          borderSide: BorderSide(color: const Color.fromARGB(255, 251, 86, 86))),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: const Color.fromARGB(255, 251, 86, 86))),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: const Color.fromARGB(255, 209, 209, 209))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: const Color.fromARGB(255, 209, 209, 209))),
      ),
    );
  }
}