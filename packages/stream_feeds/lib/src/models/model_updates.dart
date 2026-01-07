import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

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
    this.removedIds = const {},
    this.updated = const [],
  });

  /// A list of items that have been added to the collection.
  @override
  final List<T> added;

  /// A set of IDs of items that have been removed from the collection.
  @override
  final Set<String> removedIds;

  /// A list of items that have been updated in the collection.
  @override
  final List<T> updated;
}

/// Extension providing utilities for working with [ModelUpdates].
extension ModelUpdatesExtension<T extends Object> on ModelUpdates<T> {
  /// Applies these updates to the given [list].
  ///
  /// Applies all changes from this [ModelUpdates] instance to the provided list:
  /// - Replaces items in [list] that match items in [updated] by their key
  /// - Adds items from [added] that don't already exist in [list]
  /// - Removes items from [list] whose keys are in [removedIds]
  ///
  /// The [key] function is used to extract a unique identifier from each item
  /// for matching and comparison purposes.
  ///
  /// When [compare] is provided, the resulting list will be sorted using the
  /// comparator. This is useful for maintaining a specific sort order after
  /// applying updates.
  ///
  /// Returns a new list with all updates applied. The original [list] is not modified.
  ///
  /// Example:
  /// ```dart
  /// final updates = ModelUpdates<FollowData>(
  ///   added: [newFollow1, newFollow2],
  ///   updated: [updatedFollow],
  ///   removedIds: {'follow-id-to-remove'},
  /// );
  ///
  /// final updatedList = updates.applyTo(
  ///   currentFollows,
  ///   key: (follow) => follow.id,
  ///   compare: followsSort.compare,
  /// );
  /// ```
  List<T> applyTo(
    List<T> list, {
    required String Function(T item) key,
    Comparator<T>? compare,
  }) {
    final updatedList = list
        .batchReplace(updated, key: key) // replace updated items
        .merge(added, key: key) // merge added items
        .whereNot((it) => removedIds.contains(key(it))); // remove deleted items

    // Return sorted list if comparator is provided
    return compare?.let(updatedList.sorted) ?? updatedList.toList();
  }
}
