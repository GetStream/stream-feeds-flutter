import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_initializer.config.dart';

final locator = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> initDI({String? env}) => locator.init(environment: env);
Future<void> resetDI({bool dispose = true}) => locator.reset(dispose: dispose);
