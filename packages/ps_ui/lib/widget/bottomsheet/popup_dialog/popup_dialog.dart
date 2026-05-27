import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ps_ui/theme/theme.dart';
import 'package:ps_ui/widget/icon_button/icon_button.dart';

class PSPopupDialog extends StatelessWidget {
  final Widget child;
  final VoidCallback? onClose;
  final bool isDismissable;
  const PSPopupDialog(
      {super.key,
      required this.child,
      this.onClose,
      required this.isDismissable});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: isDismissable,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          icon: onClose == null
              ? null
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PSIconButton(
                      icon: Icons.close,
                      style: PSIconButtonStyle.circular(
                        Theme.of(context),
                        buttonSize: PSDimens.grid32,
                      ),
                      onTap: () {
                        onClose?.call();
                      },
                    ),
                  ],
                ),
          insetPadding: const EdgeInsets.symmetric(
              horizontal: PSDimens.grid24, vertical: PSDimens.grid24),
          contentPadding: EdgeInsets.zero,
          iconPadding: const EdgeInsets.only(bottom: PSDimens.grid16),
          titlePadding: EdgeInsets.zero,
          content: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: PSDimens.grid24, vertical: 32),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: PSColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                // physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [child],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class AppDialog<T> {
//   final BuildContext context;
//   final Widget child;
//   final VoidCallback? onClose;
//   final VoidCallback? onAutoClose;
//   bool isDismissable;



//   AppDialog(
//       {required this.context,
//       required this.child,
//       this.onClose,
//       this.fixedTitleForScrollable,
//       this.onAutoClose,
//       required this.routeName,
//       this.isDismissable = true});
//   AppDialog.autoClose(
//       {required this.context,
//       required this.child,
//       required this.routeName,
//       this.onClose,
//       this.onAutoClose,
//       this.fixedTitleForScrollable,
//       Duration closeAfter = PSDimens.duration2s,
//       this.isDismissable = false}) {
//     isDismissable = false;
//     Future.delayed(closeAfter, () {
//       if (onAutoClose == null) {
//         Get.back(/*id: NavigationKey.dashboard*/);
//       } else {
//         Get.back(/*id: NavigationKey.dashboard*/);
//         onAutoClose?.call();
//       }
//     });
//   }

//   Future<T?> show() async {
//     return await Get.dialog<T?>(
//       WillPopScope(
//         onWillPop: () async {
//           return isDismissable;
//         },
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
//           child: AlertDialog(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             icon: onClose == null
//                 ? null
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       PSIconButton(
//                         icon: Icons.close,
//                         style: PSIconButtonStyle.circular(
//                           context.theme,
//                           buttonSize: PSDimens.grid32,
//                         ),
//                         onTap: () {
//                           onClose?.call();
//                         },
//                       ),
//                     ],
//                   ),
//             insetPadding: PSDimens.grid24.hvPadding as EdgeInsets,
//             contentPadding: EdgeInsets.zero,
//             iconPadding: const EdgeInsets.only(bottom: PSDimens.grid16),
//             titlePadding: EdgeInsets.zero,
//             content: GestureDetector(
//               onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: PSDimens.grid24, vertical: 32),
//                 width: Get.width,
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: SingleChildScrollView(
//                   // physics: const NeverScrollableScrollPhysics(),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [child],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       routeSettings: RouteSettings(name: routeName),
//     );
//   }
// }
