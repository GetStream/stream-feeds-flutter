import 'package:jiffy/jiffy.dart';

extension DateTimeExtensions on DateTime {
  String get displayRelativeTime => Jiffy.parseFromDateTime(this).fromNow();
}