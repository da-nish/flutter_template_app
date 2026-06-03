import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';
import 'package:ps_whatsnext/basic_profile/widget/dashed_border.dart';

// class StepSectionModel{
//   final String title;
//   final String description;

//   StepSectionModel({required this.title, required this.description});
// }

// class StepModel{
//   final String stepTitle;
//   final String stepStatus;
//   final List<StepSectionModel> sectionList;

//   StepModel({required this.stepTitle, required this.stepStatus, required this.sectionList});
// }

class StepSectionModel {
  final String title;
  final String description;

  StepSectionModel({required this.title, required this.description});

  factory StepSectionModel.fromJson(Map<String, dynamic> json) {
    return StepSectionModel(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description};
  }
}

class StepModel {
  final String stepTitle;
  final String stepStatus;
  final List<StepSectionModel> sectionList;

  StepModel({
    required this.stepTitle,
    required this.stepStatus,
    required this.sectionList,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      stepTitle: json['title'] as String,
      stepStatus: json['status'] as String,
      sectionList: (json['step_data'] as List<dynamic>)
          .map(
            (item) => StepSectionModel.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': stepTitle,
      'status': stepStatus,
      'step_data': sectionList.map((section) => section.toJson()).toList(),
    };
  }
}

class VerticalStepperWidget extends StatelessWidget {
  final SectionModel section;
  const VerticalStepperWidget({super.key, required this.section});



  List<StepModel> getList(){
    return section.content.map((e){
      return StepModel.fromJson(e);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [

        ...getList().map((e){
          return StepWidget(step: e);
        })

      
      ],
    );
  }
}

class StepWidget extends StatelessWidget {

  final StepModel step;

  const StepWidget({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Container(
              // padding: EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.green,
              ),
              child: Icon(Icons.check_circle, color: Colors.green, size: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(step.stepTitle),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: DashedLeftBorder(
            dashHeight: 4,
            gap: 3,
            width: 1,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: step.sectionList.map((e) {
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.edit_document, size: 20),
                          Text(e.title, style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              e.description,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SimpleStep {
  final IconData icon;
  final String title;
  final Widget child;

  SimpleStep({required this.icon, required this.title, required this.child});
}
