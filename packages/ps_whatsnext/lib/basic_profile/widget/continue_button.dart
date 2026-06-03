
import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/basic_profile_screen.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';
import 'package:ps_whatsnext/json/basic_profile_step_2.dart';

class ContinueButtonWidget extends StatelessWidget {
  final SectionModel section;
  final FormController formController;
  final GlobalKey<FormState> formKey;

  const ContinueButtonWidget({super.key, required this.section, required this.formController, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final text =
        section.content.first['title'] ?? '';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(onPressed: (){


      if(section.type=="continue_button"){
       formController.validate();
       final result = formKey.currentState!.validate();
       print("=======result: $result");
       if (!result) {
          // All fields are valid
           return;
        }
       
      }

      final screenModel = DynamicScreenModel.fromJson(basicProfileStep2Response);

      if(section.content.first['route'] == "main_screen-1"){
        // Navigator.popUntil(context, ModalRoute.withName('/whatnext_screen'));
        Navigator.popUntilWithResult(context, ModalRoute.withName('/whatnext_screen'), "refresh now");
      }
      else{
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DynamicUIScreen(
              screen: screenModel,
            ),
          ),
        );
      }
      }, 
      child: Text("$text")
      )
    );
  }
}

