import 'package:args/args.dart';
import 'package:ps_cli/generator.dart';

void main(List<String> arguments) {
  final parser = ArgParser();

  parser.addCommand('generate')
    .addOption(
      'name',
      abbr: 'n',
      help: 'Feature/module name',
    );

  final results = parser.parse(arguments);

  if (results.command?.name == 'generate') {
    final featureName = results.command?['name'];


    if (featureName == null) {
      print('Please provide feature name');
      return;
    }

    generateFeature(featureName);
  } else {
    print('Usage:');
    print('ps_cli generate -n auth');
  }
}