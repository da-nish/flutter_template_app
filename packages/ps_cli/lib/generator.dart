import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:recase/recase.dart';

void generateFeature(String featureName) {
  final snakeName = ReCase(featureName).snakeCase;
  final pascalName = ReCase(featureName).pascalCase;
  final camelName = ReCase(featureName).camelCase;

  final basePath = path.join(
    Directory.current.path,
    'lib',
    'app',
    'screens',
    snakeName,
  );

  final folders = [
    'controller',
    'repository',
    'view',
    'state',
  ];

  for (final folder in folders) {
    Directory(path.join(basePath, folder))
        .createSync(recursive: true);
  }

  _generateFile(
    'controller.tpl',
    path.join(
      basePath,
      'controller',
      '${snakeName}_controller.dart',
    ),
    snakeName,
    pascalName,
    camelName
  );

  _generateFile(
    'repository.tpl',
    path.join(
      basePath,
      'repository',
      '${snakeName}_repository.dart',
    ),
    snakeName,
    pascalName,
    camelName
  );

  _generateFile(
    'screen.tpl',
    path.join(
      basePath,
      'view',
      '${snakeName}_screen.dart',
    ),
    snakeName,
    pascalName,
    camelName
  );

  _generateFile(
    'state.tpl',
    path.join(
      basePath,
      'state',
      '${snakeName}_state.dart',
    ),
    snakeName,
    pascalName,
    camelName
  );

  _generateFile(
    'module.tpl',
    path.join(
      basePath,
      '${snakeName}_module.dart',
    ),
    snakeName,
    pascalName,
    camelName
  );

  print('✅ Feature "$snakeName" generated successfully!');
}

void _generateFile(
  String templateName,
  String outputPath,
  String snakeName,
  String pascalName,
  String camelName,
) {

// final snakeName = toSnakeCase(featureName);

final scriptDir = File(Platform.script.toFilePath()).parent.path;

final templateFile = File(
  path.join(
    scriptDir,
    '..',
    'lib',
    'templates',
    templateName,
  ),
);

  String content = templateFile.readAsStringSync();

  content = content.replaceAll(
    '{{feature_name}}',
    snakeName,
  );

  content = content.replaceAll(
    '{{featureName}}',
    camelName,
  );

  content = content.replaceAll(
    '{{FeatureName}}',
    pascalName,
  );

  File(outputPath).writeAsStringSync(content);
}

String toSnakeCase(String input) {
  return input
      .replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => '_${match.group(0)!.toLowerCase()}',
      )
      .replaceFirst(RegExp(r'^_'), '');
}