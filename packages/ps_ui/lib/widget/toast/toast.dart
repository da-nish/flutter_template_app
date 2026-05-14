// ignore_for_file: constant_identifier_names
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ps_ui/widget/toast/extension.dart';
import 'package:ps_ui/widget/toast/toast_style.dart';
export 'toast_style.dart';
export 'extension.dart';

enum PSToastGravity {
  TOP,
  BOTTOM,
  CENTER,
  TOP_LEFT,
  TOP_RIGHT,
  BOTTOM_LEFT,
  BOTTOM_RIGHT,
  CENTER_LEFT,
  CENTER_RIGHT,
  SNACKBAR,
  NONE
}

enum PSToastTime {
  /// Show Long toast for 1 sec
  LENGTH_SHORT,

  /// Show Long toast for 5 sec
  LENGTH_LONG
}

class PSToast {
  final String message;
  final PSToastStyle style;

  PSToast({
    required this.style,
    required this.message,
  }) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: style.toastLength?.toToastTime(),
        gravity: style.gravity.toToastGravity(),
        timeInSecForIosWeb: style.timeInSecond,
        backgroundColor: style.backgroundColor,
        textColor: style.textColor,
        fontSize: style.fontSize);
  }
}
