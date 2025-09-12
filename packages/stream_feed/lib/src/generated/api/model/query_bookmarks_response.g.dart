// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_bookmarks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryBookmarksResponse _$QueryBookmarksResponseFromJson(
        Map<String, dynamic> json) =>
    QueryBookmarksResponse(
      bookmarks: (json['bookmarks'] as List<dynamic>)
          .map((e) => BookmarkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$QueryBookmarksResponseToJson(
        QueryBookmarksResponse instance) =>
    <String, dynamic>{
      'bookmarks': instance.bookmarks.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
      'next': instance.next,
      'prev': instance.prev,
    };
