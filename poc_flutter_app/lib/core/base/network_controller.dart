// // import 'dart:async';
// // import 'package:get/get.dart';
// // import 'package:propshare_ia_app/app/widgets/snackbar/app_snackbar.dart';
// // import 'package:propshare_ia_app/app/widgets/snackbar/app_snackbar_style.dart';
// // import 'package:ps_api/core/utils/network_helper.dart';

// import 'package:ps_api/core/utils/network_helper.dart';

// class NetworkController {

//   NetworkController(){
//     PSNetworkHelper.instance.addNetworkListner(updateConnectionStatus);
//   }
  
//   SnackbarController? _snackBarController;

//   /// Listen network changes
//   Future<void> updateConnectionStatus(bool isConnected) async {
//     if (!isConnected) {
//       _snackBarController = AppSnackBar(
//         message: "No Internet Connection",
//         style: AppSnackbarStyle.defaultTheme(Get.theme),
//       ).show();
//     } else {
//       if (_snackBarController != null && Get.isSnackbarOpen) {
//         _snackBarController?.close();
//       }
//     }
//   }
// }
