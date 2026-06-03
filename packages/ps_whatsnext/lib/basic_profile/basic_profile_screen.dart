import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';
import 'package:ps_whatsnext/basic_profile/widget/checkbox_widget.dart';
import 'package:ps_whatsnext/basic_profile/widget/continue_button.dart';
import 'package:ps_whatsnext/basic_profile/widget/list_grid_view.dart';
import 'package:ps_whatsnext/basic_profile/widget/local_sheet.dart';
import 'package:ps_whatsnext/basic_profile/widget/search_view.dart';
import 'package:ps_whatsnext/basic_profile/widget/step_widget.dart';
import 'package:ps_whatsnext/basic_profile/widget/textfield.dart';


class FormController{
  final Map<String, dynamic> formData = {};
  void addField(SectionModel item){
    formData[item.id] = "";
  }

  void updateValue(String id, dynamic value){
    formData[id] = value;
  }

  String getValue(String id){
    return formData[id] ?? '';
  }


  void validate(){
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
  final formController = FormController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    
    for(SectionModel item in widget.screen.sections){
      if(item.isInputType){
        formController.addField(item);
      }
    }
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screen.screenTitle),
      ),
      body: Form(
        key: formKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: 
        SingleChildScrollView(
           padding: const EdgeInsets.all(16),
          child: Column(
            children: widget.screen.sections.map((item){
            return SectionRenderer(
              section: item,
              formController: formController,
              formKey: formKey,
            );
          }).toList()
          ),
        )
        // ListView.builder(
        //   padding: const EdgeInsets.all(16),
        //   itemCount: widget.screen.sections.length,
          
        //   itemBuilder: (context, index) {
        //     return SectionRenderer(
        //       section: widget.screen.sections[index],
        //       formController: formController,
        //       formKey: formKey,
        //     );
        //   },
        // ),
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
        return SectionTitleWidget(section);

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

      default:
        return const SizedBox.shrink();
    }
  }
}
