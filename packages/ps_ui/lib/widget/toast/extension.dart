import 'package:fluttertoast/fluttertoast.dart';
import 'package:ps_ui/widget/toast/toast.dart';

extension PSToastGravityTypeExtension on PSToastGravity {
  ToastGravity toToastGravity() {
    switch (this) {
      case PSToastGravity.TOP:
        return ToastGravity.TOP;
      case PSToastGravity.BOTTOM:
        return ToastGravity.BOTTOM;
      case PSToastGravity.CENTER:
        return ToastGravity.CENTER;
      case PSToastGravity.TOP_LEFT:
        return ToastGravity.TOP_LEFT;
      case PSToastGravity.TOP_RIGHT:
        return ToastGravity.TOP_RIGHT;
      case PSToastGravity.BOTTOM_LEFT:
        return ToastGravity.BOTTOM_LEFT;
      case PSToastGravity.BOTTOM_RIGHT:
        return ToastGravity.BOTTOM_RIGHT;
      case PSToastGravity.CENTER_LEFT:
        return ToastGravity.CENTER_LEFT;
      case PSToastGravity.CENTER_RIGHT:
        return ToastGravity.CENTER_RIGHT;
      case PSToastGravity.SNACKBAR:
        return ToastGravity.SNACKBAR;
      case PSToastGravity.NONE:
        return ToastGravity.NONE;
    }
  }
}

extension PSToastTimeExtension on PSToastTime {
  Toast toToastTime() {
    switch (this) {
      case PSToastTime.LENGTH_SHORT:
        return Toast.LENGTH_SHORT;
      case PSToastTime.LENGTH_LONG:
        return Toast.LENGTH_LONG;
    }
  }
}
