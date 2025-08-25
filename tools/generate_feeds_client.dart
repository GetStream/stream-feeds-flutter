// // tool/generate_feeds_client.dart
// // Cross-platform Feeds OpenAPI -> Dart client generator.
// // Usage examples:
// //   dart run tool/generate_feeds_client.dart
// //   dart run tool/generate_feeds_client.dart -c ../chat -o packages/stream_feeds/lib/src/generated/api
// //   dart run tool/generate_feeds_client.dart --products feeds,common --version v2 --dry-run
//
// import 'dart:convert';
// import 'dart:io';
//
// void main(List<String> args) async {
//   final opts = _Options.parse(args);
//
//   final repoRoot = await _detectRepoRoot() ?? Directory.current.path;
//   final chatDir = await _detectChatDir(opts.chatDir, repoRoot);
//   final outputDir = _detectOutputDir(opts.outputDir, repoRoot);
//
//   _requireTools(['go', 'melos']);
//
//   stdout.writeln('== Feeds client generation ==');
//   stdout.writeln('Repo root : $repoRoot');
//   stdout.writeln('CHAT_DIR  : $chatDir');
//   stdout.writeln('OUTPUT_DIR: $outputDir');
//   stdout.writeln('PRODUCTS  : ${opts.products}');
//   stdout.writeln('VERSION   : ${opts.version}');
//   stdout.writeln('SPEC_NAME : ${opts.specName}');
//   if (opts.dryRun) stdout.writeln('(dry-run mode)');
//
//   // 1) Clean old generated models (guarded)
//   await _safeRmGlob(
//     Directory(outputDir),
//     subglob: Platform.isWindows ? r'model\*' : 'model/*',
//     dryRun: opts.dryRun,
//   );
//
//   // 2) Generate OpenAPI spec in chat repo
//   final specDirRel = 'releases/${opts.version}';
//   final specStem = opts.specName;
//   final specPathRel = '$specDirRel/$specStem.yaml';
//
//   await _run(
//     [
//       'go',
//       'run',
//       './cmd/chat-manager',
//       'openapi',
//       'generate-spec',
//       '-products',
//       opts.products,
//       '-version',
//       opts.version,
//       '-clientside',
//       '-encode-time-as-unix-timestamp',
//       '-output',
//       '$specDirRel/$specStem'
//     ],
//     workingDirectory: chatDir,
//     dryRun: opts.dryRun,
//   );
//
//   if (!opts.dryRun) {
//     final specFile = File(_join(chatDir, specPathRel));
//     if (!await specFile.exists()) {
//       stderr.writeln('Spec not found at ${specFile.path}');
//       exit(1);
//     }
//   }
//
//   // 3) Generate Dart client into OUTPUT_DIR
//   await _run(
//     [
//       'go',
//       'run',
//       './cmd/chat-manager',
//       'openapi',
//       'generate-client',
//       '--language',
//       'dart',
//       '--spec',
//       './$specPathRel',
//       '--output',
//       outputDir
//     ],
//     workingDirectory: chatDir,
//     dryRun: opts.dryRun,
//   );
//
//   // 4) Run melos steps from repo root (or CWD if no melos.yaml there)
//   final melosCwd = await File(_join(repoRoot, 'melos.yaml')).exists()
//       ? repoRoot
//       : Directory.current.path;
//
//   for (final cmd in [
//     ['melos', 'clean'],
//     ['melos', 'bs'],
//     ['melos', 'generate:all'],
//     ['melos', 'format'],
//   ]) {
//     await _run(cmd, workingDirectory: melosCwd, dryRun: opts.dryRun);
//   }
//
//   stdout.writeln('✅ Done.');
// }
//
// // ---------------- helpers ----------------
//
// class _Options {
//   final String? chatDir;
//   final String? outputDir;
//   final String products;
//   final String version;
//   final String specName;
//   final bool dryRun;
//
//   _Options({
//     required this.chatDir,
//     required this.outputDir,
//     required this.products,
//     required this.version,
//     required this.specName,
//     required this.dryRun,
//   });
//
//   static _Options parse(List<String> args) {
//     // Minimal flag parsing (no extra deps)
//     String? chatDir;
//     String? outputDir;
//     String products = Platform.environment['PRODUCTS'] ?? 'feeds,common';
//     String version = Platform.environment['VERSION'] ?? 'v2';
//     String specName =
//         Platform.environment['SPEC_NAME'] ?? 'feeds-clientside-api';
//     bool dryRun = (Platform.environment['DRY_RUN'] ?? '').isNotEmpty;
//
//     final it = args.iterator;
//     while (it.moveNext()) {
//       final a = it.current;
//       switch (a) {
//         case '-c':
//         case '--chat':
//         case '--chat-dir':
//           if (!it.moveNext()) _usage('Expected value after $a');
//           chatDir = it.current;
//           break;
//         case '-o':
//         case '--out':
//         case '--output':
//           if (!it.moveNext()) _usage('Expected value after $a');
//           outputDir = it.current;
//           break;
//         case '-p':
//         case '--products':
//           if (!it.moveNext()) _usage('Expected value after $a');
//           products = it.current;
//           break;
//         case '-v':
//         case '--version':
//           if (!it.moveNext()) _usage('Expected value after $a');
//           version = it.current;
//           break;
//         case '-n':
//         case '--spec-name':
//           if (!it.moveNext()) _usage('Expected value after $a');
//           specName = it.current;
//           break;
//         case '--dry-run':
//           dryRun = true;
//           break;
//         case '-h':
//         case '--help':
//           _usage();
//           break;
//         default:
//           if (a.startsWith('-')) _usage('Unknown option $a');
//       }
//     }
//     return _Options(
//       chatDir: chatDir,
//       outputDir: outputDir,
//       products: products,
//       version: version,
//       specName: specName,
//       dryRun: dryRun,
//     );
//   }
//
//   static Never _usage([String? error]) {
//     if (error != null) {
//       stderr.writeln(error);
//       stderr.writeln('');
//     }
//     stdout.writeln('''Usage:
//   dart run tool/generate_feeds_client.dart [options]
//
// Options:
//   -c, --chat-dir <path>     Path to chat repo (auto-detects ../chat)
//   -o, --output <path>       Output dir for generated Dart client
//   -p, --products <list>     Products list (default: feeds,common)
//   -v, --version <v>         API version (default: v2)
//   -n, --spec-name <name>    Spec filename stem (default: feeds-clientside-api)
//       --dry-run             Print commands; don\'t execute
//   -h, --help                Show help
//
// Env vars override defaults too: PRODUCTS, VERSION, SPEC_NAME, DRY_RUN
// ''');
//     exit(error == null ? 0 : 2);
//   }
// }
//
// Future<String?> _detectRepoRoot() async {
//   try {
//     final res = await Process.run('git', ['rev-parse', '--show-toplevel']);
//     if (res.exitCode == 0) {
//       return (res.stdout as String).trim();
//     }
//   } catch (_) {}
//   return null;
// }
//
// Future<String> _detectChatDir(String? provided, String repoRoot) async {
//   if (provided != null && provided.isNotEmpty) {
//     final dir = Directory(provided);
//     if (await dir.exists()) return dir.absolute.path;
//     stderr.writeln('CHAT_DIR not found: ${dir.path}');
//     exit(1);
//   }
//   // Sibling heuristic: <repo>/../chat
//   final sibling = Directory(_join(repoRoot, '..', 'chat'));
//   if (await sibling.exists()) return sibling.absolute.path;
//
//   // Fallback: ./chat inside current repo
//   final local = Directory(_join(repoRoot, 'chat'));
//   if (await local.exists()) return local.absolute.path;
//
//   stderr.writeln('Could not auto-detect chat repo. Provide -c/--chat-dir.');
//   exit(1);
// }
//
// String _detectOutputDir(String? provided, String repoRoot) {
//   if (provided != null && provided.isNotEmpty) {
//     Directory(provided).createSync(recursive: true);
//     return Directory(provided).absolute.path;
//   }
//   final canonical = Directory(
//     _join(
//         repoRoot, 'packages', 'stream_feeds', 'lib', 'src', 'generated', 'api'),
//   );
//   if (canonical.existsSync()) return canonical.path;
//
//   final fallback = Directory(_join(repoRoot, 'generated', 'stream_feeds_api'))
//     ..createSync(recursive: true);
//   return fallback.path;
// }
//
// void _requireTools(List<String> tools) {
//   for (final t in tools) {
//     if (!_inPath(t)) {
//       stderr.writeln('Missing required command: $t');
//       exit(1);
//     }
//   }
// }
//
// bool _inPath(String exe) {
//   final which = Platform.isWindows ? 'where' : 'which';
//   try {
//     final res = Process.runSync(which, [exe]);
//     return res.exitCode == 0;
//   } catch (_) {
//     return false;
//   }
// }
//
// Future<void> _safeRmGlob(Directory targetDir,
//     {required String subglob, required bool dryRun}) async {
//   if (!await targetDir.exists()) {
//     stderr.writeln(
//         'safeRmGlob: target directory does not exist: ${targetDir.path}');
//     exit(1);
//   }
//   // Guard: only allow deletion inside a "generated/.../api" style path
//   final normalized = targetDir.path.replaceAll('\\', '/');
//   final allowed = RegExp(r'/generated(/|$).*(/api(/|$)|stream_feeds_api(/|$))');
//   if (!allowed.hasMatch(normalized)) {
//     stderr.writeln(
//         'Refusing to delete in unexpected directory: ${targetDir.path}');
//     exit(1);
//   }
//
//   if (dryRun) {
//     stdout.writeln('[dry-run] delete ${_join(targetDir.path, subglob)}');
//     return;
//   }
//
//   // Manual glob: delete children in "model/*"
//   final modelDir = Directory(_join(targetDir.path, 'model'));
//   if (!await modelDir.exists()) return;
//   await for (final ent in modelDir.list(recursive: false, followLinks: false)) {
//     try {
//       if (ent is File) {
//         await ent.delete();
//       } else if (ent is Directory) {
//         await ent.delete(recursive: true);
//       }
//     } catch (e) {
//       stderr.writeln('Failed to delete ${ent.path}: $e');
//       exit(1);
//     }
//   }
// }
//
// Future<void> _run(List<String> cmd,
//     {String? workingDirectory, bool dryRun = false}) async {
//   final pretty = '${cmd.first} ${cmd.skip(1).map(_shellQuote).join(' ')}';
//   stdout.writeln(r'$ ' +
//       pretty +
//       (workingDirectory != null ? '  (cwd: $workingDirectory)' : ''));
//   if (dryRun) return;
//
//   final process = await Process.start(
//     cmd.first,
//     cmd.skip(1).toList(),
//     workingDirectory: workingDirectory,
//     runInShell: true,
//   );
//
//   // Pipe IO
//   process.stdout.transform(utf8.decoder).listen(stdout.write);
//   process.stderr.transform(utf8.decoder).listen(stderr.write);
//
//   final _exitCode = await process.exitCode;
//   if (_exitCode != 0) {
//     stderr.writeln('Command failed ($_exitCode): $pretty');
//     exitCode = _exitCode;
//     exit(_exitCode);
//   }
// }
//
// String _shellQuote(String a) {
//   if (a.isEmpty) return '""';
//   final needs = RegExp(r'[^\w@%+=:,./-]').hasMatch(a);
//   if (!needs) return a;
//   if (Platform.isWindows) {
//     // Simple Windows quoting
//     return '"${a.replaceAll('"', r'\"')}"';
//   } else {
//     return "'${a.replaceAll("'", r"'\''")}'";
//   }
// }
//
// String _join(
//   String a, [
//   String? b,
//   String? c,
//   String? d,
//   String? e,
//   String? f,
//   String? g,
// ]) {
//   final parts = [
//     a,
//     if (b != null) b,
//     if (c != null) c,
//     if (d != null) d,
//     if (e != null) e,
//     if (f != null) f,
//     if (g != null) g,
//   ];
//   return parts.join(Platform.pathSeparator);
// }
