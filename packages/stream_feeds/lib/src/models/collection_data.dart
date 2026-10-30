import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';

part 'collection_data.freezed.dart';

/// A collection in the Stream Feeds system.
///
/// Collections are data objects that can be attached to activities for managing
/// shared data across multiple activities. They are useful for storing reusable
/// content like products, articles, or any custom objects.
@freezed
class CollectionData with _$CollectionData {
  /// Creates a new [CollectionData] instance.
  const CollectionData({
    required this.id,
    required this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.custom,
  });

  /// The unique identifier of the collection.
  @override
  final String id;

  /// The name of the collection.
  @override
  final String name;

  /// The status of the collection when enriched.
  ///
  /// This field is only present when the collection is embedded in an activity.
  /// It indicates whether the collection was found during enrichment.
  @override
  final CollectionStatus? status;

  /// The date and time when the collection was created.
  @override
  final DateTime? createdAt;

  /// The date and time when the collection was last updated.
  @override
  final DateTime? updatedAt;

  /// The ID of the user who owns this collection.
  @override
  final String? userId;

  /// Custom data associated with the collection.
  @override
  final Map<String, Object?>? custom;
}

/// Reads a [CollectionStatus] as the `String` it already is.
extension CollectionStatusValue on CollectionStatus {
  /// The raw value.
  @Deprecated('CollectionStatus is a String; use it directly.')
  String get value => this;
}

/// Extension function to convert an [EnrichedCollectionResponse] to a [CollectionData] model.
extension EnrichedCollectionResponseMapper on EnrichedCollectionResponse {
  /// Converts this API enriched collection response to a domain [CollectionData] instance.
  CollectionData toModel() {
    return CollectionData(
      id: id,
      name: name,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId,
      custom: custom,
    );
  }
}
