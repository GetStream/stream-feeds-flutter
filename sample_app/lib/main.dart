import 'package:flutter/widgets.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(const StreamFeedsSampleApp());
}
