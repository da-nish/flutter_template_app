export 'controller/{{feature_name}}_controller.dart';
export 'repository/{{feature_name}}_repository.dart';
export 'view/{{feature_name}}_screen.dart';
export 'state/{{feature_name}}_state.dart';



/***

Route Configuration

    static const String {{featureName}}Screen='/{{feature_name}}_screen';

    GoRoute(
        path: AppRoutes.{{featureName}}Screen,
        builder: (context, state) => const {{FeatureName}}Screen(),
    ),

***/