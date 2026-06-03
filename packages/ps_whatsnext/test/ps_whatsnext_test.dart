import 'package:flutter_test/flutter_test.dart';
import 'package:ps_whatsnext/basic_profile/response_model.dart';
import 'package:ps_whatsnext/basic_profile/basic_profile_screen.dart';

void main() {
  test('evaluates VisibilityCondition and manages reactive field IDs correctly', () {
    final sections = [
      SectionModel(
        id: '__#13__',
        type: 'inbuild_sheet_selection',
        style: 'basic',
        required: true,
        isInputType: true,
        content: [
          {'title': 'Country', 'id': 'country_sheet_selection'}
        ],
      )
    ];

    final controller = FormController(sections: sections);
    controller.addField(sections.first);

    // Initial state
    expect(controller.getValue('__#13__'), '');
    expect(controller.getValue('country_sheet_selection'), '');

    // Rule: country_sheet_selection equals US
    final condition = VisibilityCondition(
      operator: 'equals',
      field: 'country_sheet_selection',
      value: 'US',
    );

    // Should be false initially
    expect(condition.evaluate(controller.formData), isFalse);

    // Update section ID directly
    controller.updateValue('__#13__', 'US');

    // Both section ID and content item ID should match
    expect(controller.getValue('__#13__'), 'US');
    expect(controller.getValue('country_sheet_selection'), 'US');

    // Condition should now evaluate to true
    expect(condition.evaluate(controller.formData), isTrue);

    // Update with non-matching value
    controller.updateValue('country_sheet_selection', 'IN');
    expect(controller.getValue('__#13__'), 'IN');
    expect(controller.getValue('country_sheet_selection'), 'IN');
    expect(condition.evaluate(controller.formData), isFalse);
  });
}
