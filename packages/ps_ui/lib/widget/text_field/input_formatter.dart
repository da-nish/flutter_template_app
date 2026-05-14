import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PSAmountInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    int? parsedValue = int.tryParse(newValueText);
    if (parsedValue == null) {
      return oldValue;
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;

      final commaFormat = NumberFormat("##,##,###", "en_US");
      String valueWithComma = commaFormat.format(parsedValue);
      // amoutTextController.text = valueWithComma;
      int offset = valueWithComma.length - selectionIndex;
      if (offset < 0) {
        offset = 0;
      }
      return TextEditingValue(
        text: valueWithComma.toString(),
        selection: TextSelection.collapsed(
          offset: offset,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
