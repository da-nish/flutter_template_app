


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// part 'internet_controller.g.dart';


class InternetStatusController extends StreamNotifier<InternetStatus> {
  @override
  Stream<InternetStatus> build() {

    final connectionChecker = InternetConnection();
    return connectionChecker.onStatusChange;
  }
}

final internetStatusControllerProvider = StreamNotifierProvider<InternetStatusController, InternetStatus>(
  InternetStatusController.new,
  isAutoDispose: true,
);
