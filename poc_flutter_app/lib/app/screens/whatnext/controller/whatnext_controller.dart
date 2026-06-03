import 'package:poc_flutter_app/app/screens/whatnext/repository/whatnext_repository.dart';
import 'package:poc_flutter_app/app/screens/whatnext/state/whatnext_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'whatnext_controller.g.dart';


@riverpod
class WhatnextController {

  final WhatnextRepositoryI dataRepo = WhatnextRepository();

  @override
  WhatnextState build() {
    Future.microtask(() => loadItems());
    return WhatnextState.initial();
  }

  Future<void> loadItems() async{}
}