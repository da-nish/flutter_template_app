import 'package:poc_flutter_app/app/screens/{{feature_name}}/repository/{{feature_name}}_repository.dart';
import 'package:poc_flutter_app/app/screens/{{feature_name}}/state/{{feature_name}}_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{feature_name}}_controller.g.dart';


@riverpod
class {{FeatureName}}Controller extends _${{FeatureName}}Controller {

  final {{FeatureName}}RepositoryI dataRepo = {{FeatureName}}Repository();

  @override
  {{FeatureName}}State build() {
    Future.microtask(() => loadItems());
    return {{FeatureName}}State.initial();
  }

  Future<void> loadItems() async{}
}