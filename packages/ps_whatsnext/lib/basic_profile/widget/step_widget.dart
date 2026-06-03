import 'package:flutter/material.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';
import 'package:ps_whatsnext/basic_profile/widget/textfield.dart';

class StepProgressWidget extends StatelessWidget {
  final int currentStep; // 1-based index
  final int totalSteps;

  const StepProgressWidget({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  Color _getColor(int index) {
    if (index < currentStep) {
      return Colors.green; // success
    } else if (index == currentStep) {
      return Colors.blue; // current
    } else {
      return Colors.grey; // upcoming
    }
  }

  Widget _buildStep(int index) {
    final color = _getColor(index);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Circle
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
    
        // Line (except last step)
        if (index != totalSteps)
          Expanded(
            child: Container(
              height: 3,
              color: _getColor(index + 1),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSteps,
        (index){
          if(index==totalSteps-1){
            return Container(child: _buildStep(index + 1));
          }
          return Expanded(child: _buildStep(index + 1));
          }
      ),
    );
  }
}


class InfoTextWidget extends StatelessWidget {
  final SectionModel section;

  const InfoTextWidget(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.blue.shade50;

    switch (section.style) {
      case 'success':
        backgroundColor = Colors.green.shade50;
        break;

      case 'warning':
        backgroundColor = Colors.orange.shade50;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: section.content.map<Widget>((item) {
          switch (item['type']) {
            case 'image':
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  getIcon(item['item']),
                  size: 20,
                ),
              );

            case 'text':
              return Expanded(
                child: Text(item['item']),
              );

            default:
              return const SizedBox.shrink();
          }
        }).toList(),
      ),
    );
  }
}


class StepCounterWidget extends StatelessWidget {
  final SectionModel section;

  const StepCounterWidget(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    int total = section.content.first['total'];
    int current = section.content.first['current'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 100),
      child: SizedBox(
        width: 200,
        child: StepProgressWidget(currentStep: current, totalSteps: total),
        )
    );
  }
}


class SectionTitleWidget extends StatelessWidget {
  final SectionModel section;

  const SectionTitleWidget(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    IconData? icon;
    String title = '';

    for (final item in section.content) {
      if (item['type'] == 'image') {
        icon = getIcon(item['item']);
      }

      if (item['type'] == 'text') {
        title = item['item'];
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          if(icon != null)...[
            Icon(icon),
          const SizedBox(width: 8),
          ],
          
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}




class SectionInfoWidget extends StatelessWidget {
  final SectionModel section;

  const SectionInfoWidget(this.section,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final text =
        section.content.first['item'] ?? '';

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
