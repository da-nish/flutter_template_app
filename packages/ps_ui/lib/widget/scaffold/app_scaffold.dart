import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';

class PSScaffold extends StatelessWidget {
  const PSScaffold(
      {super.key,
      required this.body,
      this.backgoundColor,
      this.gradient,
      this.appBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.isLoading = false});

  final Widget body;
  final Widget? floatingActionButton;
  final LinearGradient? gradient;
  final bool isLoading;
  final PreferredSizeWidget? appBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgoundColor;

  // GlobalKey<ScaffoldState> get _scaffoldState => GlobalKey<ScaffoldState>();
  // final GlobalKey<ScaffoldState> _sKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          // key: _scaffoldState,
          // backgroundColor: Colors.amber, // backgoundColor,
          appBar: appBar,
          // key: AppMenuController.scaffoldKey,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,

          drawerEnableOpenDragGesture: false,
          body: Container(
            decoration: BoxDecoration(
              gradient: backgoundColor != null
                  ? null
                  : const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [.2, 0.8, 1.3],
                      colors: //PSColors.tempGradient
                          PSColors.backgroundGradient,
                    ),
            ),
            child: _body(context),
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    if (isLoading) {
      return Stack(
        children: [
          body,
          Container(
            height: double.infinity,
            width: double.infinity,
            color: PSColors.black0.withAlpha(150),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      );
    }
    return body;
  }
}
