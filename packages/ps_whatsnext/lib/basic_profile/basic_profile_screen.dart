import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';
import 'package:ps_whatsnext/basic_profile/widget/checkbox_widget.dart';
import 'package:ps_whatsnext/basic_profile/widget/continue_button.dart';
import 'package:ps_whatsnext/basic_profile/widget/list_grid_view.dart';
import 'package:ps_whatsnext/basic_profile/widget/local_sheet.dart';
import 'package:ps_whatsnext/basic_profile/widget/search_view.dart';
import 'package:ps_whatsnext/basic_profile/widget/step_widget.dart';
import 'package:ps_whatsnext/basic_profile/widget/textfield.dart';
import 'package:ps_whatsnext/basic_profile/widget/vertical_stepper_widget.dart';


class FormController extends ChangeNotifier {
  final Map<String, dynamic> formData = {};
  final List<SectionModel> sections;

  FormController({required this.sections});

  void addField(SectionModel item) {
    formData[item.id] = "";
    // If the section content has items with their own IDs, initialize them too.
    for (var contentItem in item.content) {
      if (contentItem is Map && contentItem.containsKey('id')) {
        formData[contentItem['id'].toString()] = "";
      }
    }
  }

  void updateValue(String id, dynamic value) {
    formData[id] = value;
    
    // Also update matching IDs
    for (var section in sections) {
      if (section.id == id) {
        for (var contentItem in section.content) {
          if (contentItem is Map && contentItem.containsKey('id')) {
            formData[contentItem['id'].toString()] = value;
          }
        }
      } else {
        for (var contentItem in section.content) {
          if (contentItem is Map && contentItem['id']?.toString() == id) {
            formData[section.id] = value;
          }
        }
      }
    }
    notifyListeners();
  }

  String getValue(String id) {
    final value = formData[id];
    if (value == null) return '';
    return value.toString();
  }

  void validate() {
    for (final entry in formData.entries) {
      print('${entry.key}: ${entry.value}');
    }
  }
}

class DynamicUIScreen extends StatefulWidget {
  final DynamicScreenModel screen;

  const DynamicUIScreen({
    super.key,
    required this.screen,
  });

  @override
  State<DynamicUIScreen> createState() => _DynamicUIScreenState();
}

class _DynamicUIScreenState extends State<DynamicUIScreen> {
  late final FormController formController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    formController = FormController(sections: widget.screen.sections);
    
    for(SectionModel item in widget.screen.sections){
      if(item.isInputType){
        formController.addField(item);
      }
    }
    formController.addListener(_onFormChanged);
    
    super.initState();
  }

  @override
  void dispose() {
    formController.removeListener(_onFormChanged);
    super.dispose();
  }

  void _onFormChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screen.screenTitle),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: widget.screen.sections.map((item) {
              if (item.visibilityConditions != null) {
                final isVisible = item.visibilityConditions!.evaluate(formController.formData);
                if (!isVisible) {
                  return const SizedBox.shrink();
                }
              }
              return SectionRenderer(
                section: item,
                formController: formController,
                formKey: formKey,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}


class SectionRenderer extends StatelessWidget {
  final SectionModel section;
  final FormController formController;
  final GlobalKey<FormState> formKey;

  const SectionRenderer({
    super.key,
    required this.section,
    required this.formController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    switch (section.type) {
      case "step_counter":
        return StepCounterWidget(section);

      case 'info_text':
        return InfoTextWidget(section);

      case 'section_title':
        return SectionTitleWidget(section: section);

      case 'grid_selection':
        return GridSelectionWidget(section: section, formController: formController);

      case 'list_selection':
        return ListSelectionWidget(section: section, formController: formController);

      case 'section_info':
        return SectionInfoWidget(section);

      case 'inbuild_sheet_selection':
        return InbuiltSheetSelectionWidget(section: section, formController: formController);
        
      case 'dynamic_select_screen':
        return InbuiltSearchScreen(section: section, formController: formController);
      
      case 'app_text_field':
        return TextFieldWidget(section: section, formController: formController);

      case 'continue_button':
        return ContinueButtonWidget(section: section, formController: formController, formKey: formKey);

      case 'app_checkbox':
        return AppChecboxWidget(section: section, formController: formController);

      case 'vertical_stepper':
        return VerticalStepperWidget(section: section);

      default:
        return const SizedBox.shrink();
    }
  }
}
