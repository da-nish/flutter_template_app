import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/basic_profile_screen.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';
import 'package:ps_whatsnext/components/progress_bar/progress_bar.dart';
import 'package:ps_whatsnext/json/aml_check.dart';
import 'package:ps_whatsnext/json/basic_profile_step_1.dart';
import 'package:ps_whatsnext/whats_next/workflow_response.dart';


class WorkflowScreen extends StatelessWidget {
  final WorkflowResponse response;

  const WorkflowScreen({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {

    return ListView(
      // padding: const EdgeInsets.all(16),
      children: [
        if(response.progress != null)
        HorizontalProgressBar(
          percentage: response.progress ?? 0.0,
        ),

       Padding(
         padding: const EdgeInsets.all(16),
         child: Column( 
          children: [

          if (response.table != null)
            DynamicTableWidget(
              table: response.table!,
            ),
            const SizedBox(height: 10),
            ...response.steps.map(
            (e) => WorkflowStepWidget(step: e),
          )
          
          ]
          ),
       )
      ],
    );
  }
}



class DynamicTableWidget extends StatelessWidget {
  final DynamicTable table;

  const DynamicTableWidget({
    super.key,
    required this.table,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            

            Text(
              table.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),

            Text(table.subtitle),

            const Divider(),

            ...table.rows.map(
              (row) => Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(row.key)),

                  Expanded(
                    child: ContentRenderer(
                      items: row.value,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



class WorkflowStepWidget extends StatelessWidget {
  final WorkflowStep step;

  const WorkflowStepWidget({
    super.key,
    required this.step,
  });

  Color getStatusColor() {
    switch (step.status) {
      case "completed":
        return Colors.green;

      case "active":
        return Colors.blue;

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      
      child: ExpansionTile(
        initiallyExpanded: step.expanded,
        expandedAlignment: Alignment.topLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.symmetric(horizontal: 20),
        title: Row(
          children: [
            CircleAvatar(
              radius: 8,
              backgroundColor: getStatusColor(),
            ),
            const SizedBox(width: 12),
            Text(step.title),
          ],
        ),
        children: [

          ContentRenderer(
            items: step.description,
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 12,
            children: step.buttons
                .map(
                  (e) => DynamicButton(button: e),
                )
                .toList(),
          ),

          const SizedBox(height: 12),

          ContentRenderer(
            items: step.note,
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}



class ContentRenderer extends StatelessWidget {
  final List<ContentItem> items;

  const ContentRenderer({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: items.map((item) {

        switch (item.type) {

          case "hyperlink":
            return GestureDetector(
              onTap: () {
                handleAction(
                  context,
                  item.action,
                );
              },
              child: Text(
                item.text,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration:
                      TextDecoration.underline,
                ),
              ),
            );

          case "text":
          default:
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 8),
              child: Text(item.text),
            );
        }
      }).toList(),
    );
  }
}


class DynamicButton extends StatelessWidget {
  final ActionButton button;

  const DynamicButton({
    super.key,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {

    switch (button.style) {

      case "hyperlink":
        return TextButton(
          onPressed: button.enabled
              ? () => handleAction(
                    context,
                    button.action,
                  )
              : null,
          child: Text(button.text),
        );

      case "pending":
        return OutlinedButton(
          onPressed: button.enabled
              ? () => handleAction(
                    context,
                    button.action,
                  )
              : null,
          child: Text(button.text),
        );

      case "disable":
        return ElevatedButton(
          onPressed: null,
          child: Text(button.text),
        );

      default:
        return ElevatedButton(
          onPressed: button.enabled
              ? () => handleAction(
                    context,
                    button.action,
                  )
              : null,
          child: Text(button.text),
        );
    }
  }
}


Future<void> handleAction(
  BuildContext context,
  ActionModel? action,
) async {
  if (action == null) return;

  switch (action.type) {

    case "navigate":
      // Navigator.pushNamed(
      //   context,
      //   action.route ?? "",
      // );

      // final screenModel = DynamicScreenModel.fromJson(basicProfileStep1Response);
      final screenData = getScreenData(action.route);
      final screenModel =  DynamicScreenModel.fromJson(screenData);

      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DynamicUIScreen(
            screen: screenModel,
          ),
        ),
      );

      // print("==>>> $result");
      break;

    case "modal":
      showModalBottomSheet(
        context: context,
    
        builder: (_) => SafeArea(
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Center(
              child: Text(
                action.id ?? "",
              ),
            ),
          ),
        ),
      );
      break;

    case "api":
      break;

    case "deeplink":
      break;
  }

}


 Map<String, dynamic> getScreenData(String? route){

    if(route=="/basic-profile"){
      return basicProfileStep1Response;
    }
    else if(route=="/aml-check"){
      return amlCheckResponse;
    }
    return {};

  }