// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:meta/meta.dart';
import 'package:state_notifier/state_notifier.dart';

extension StateNotifierExtension<T> on StateNotifier<T> {
  @internal
  T get value => state;
}
