import 'dart:io';

import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('name', abbr: 'n', help: 'The name of the module to generate')
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show this help');

  final argResults = parser.parse(arguments);

  if (argResults['help'] as bool) {
    print(parser.usage);
    return;
  }

  final moduleName = argResults['name'] as String?;

  if (moduleName == null || moduleName.isEmpty) {
    print('Error: Module name is required');
    print(parser.usage);
    exit(1);
  }

  generateModule(moduleName);
}

void generateModule(String name) {
  final moduleDir = Directory('lib/app/screens/$name');
  if (!moduleDir.existsSync()) {
    moduleDir.createSync(recursive: true);
  }

  final file = File('${moduleDir.path}/${name}_module.dart');
  file.writeAsStringSync('''
class ${_capitalize(name)}Module {
  // TODO: Implement your module
}
''');

  print('Module "$name" created at ${file.path}');
}

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);