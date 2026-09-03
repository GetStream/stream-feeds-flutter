// ignore_for_file: avoid_print

import 'dart:io' show Directory, File;

import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

/// Updates the version constant in stream_feeds/lib/src/version.dart and the
/// sample app's version, based on the version in stream_feeds' pubspec.yaml.
Future<void> main() async {
  // Target the stream_feeds package
  const packageName = 'stream_feeds';
  final rootDir = Directory.current.path;
  final packageDir = p.join(rootDir, 'packages', packageName);
  final pubspecPath = p.join(packageDir, 'pubspec.yaml');
  final versionFilePath = p.join(packageDir, 'lib', 'src', 'version.dart');

  print('Reading version from $pubspecPath');

  // Read version from pubspec.yaml
  final yamlMap = loadYaml(File(pubspecPath).readAsStringSync()) as YamlMap;
  final version = yamlMap['version'] as String;

  print('Found version: $version');

  // Read the existing version file
  final versionFile = File(versionFilePath);
  if (!versionFile.existsSync()) {
    print('Error: Version file not found at $versionFilePath');
    return;
  }

  final fileContent = versionFile.readAsStringSync();

  // Update the version constant
  final updatedContent = fileContent.replaceFirst(
    RegExp('const String packageVersion = .+;'),
    "const String packageVersion = '$version';",
  );

  // Write the changes back to the file
  await versionFile.writeAsString(updatedContent);

  print('✓ Successfully updated version to $version in $versionFilePath');

  // Android and iOS reject a pre-release tag in an app version, so the sample
  // app tracks the SDK's release without one: 0.6.0-beta.1 becomes 0.6.0.
  final appVersion = version.split('-').first;

  final sampleAppPubspecPath = p.join(rootDir, 'sample_app', 'pubspec.yaml');
  final sampleAppPubspec = File(sampleAppPubspecPath);
  final updatedSampleAppPubspec = sampleAppPubspec.readAsStringSync().replaceFirst(
    RegExp(r'^version: .+$', multiLine: true),
    'version: $appVersion',
  );

  await sampleAppPubspec.writeAsString(updatedSampleAppPubspec);

  print('✓ Successfully updated version to $appVersion in $sampleAppPubspecPath');
}
