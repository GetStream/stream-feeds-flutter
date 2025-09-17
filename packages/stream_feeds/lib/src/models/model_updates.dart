import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_updates.freezed.dart';

/// Updates to a collection of items.
///
/// Provides a structured way to represent changes to collections including
/// items that have been added, removed, or updated. The [T] type parameter
/// represents the type of items in the collection.
@freezed
class ModelUpdates<T> with _$ModelUpdates<T> {
  /// Creates a new [ModelUpdates] instance.
  const ModelUpdates({
    this.added = const [],
    this.removedIds = const [],
    this.updated = const [],
  });

  /// A list of items that have been added to the collection.
  @override
  final List<T> added;

  /// A list of IDs of items that have been removed from the collection.
  @override
  final List<String> removedIds;

  /// A list of items that have been updated in the collection.
  @override
  final List<T> updated;
}
