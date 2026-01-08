// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appeal_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppealItemResponse {
  String get appealReason;
  List<String>? get attachments;
  DateTime get createdAt;
  String? get decisionReason;
  ModerationPayload? get entityContent;
  String get entityId;
  String get entityType;
  String get id;
  String get status;
  DateTime get updatedAt;
  UserResponse? get user;

  /// Create a copy of AppealItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppealItemResponseCopyWith<AppealItemResponse> get copyWith =>
      _$AppealItemResponseCopyWithImpl<AppealItemResponse>(
          this as AppealItemResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppealItemResponse &&
            (identical(other.appealReason, appealReason) ||
                other.appealReason == appealReason) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.decisionReason, decisionReason) ||
                other.decisionReason == decisionReason) &&
            (identical(other.entityContent, entityContent) ||
                other.entityContent == entityContent) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      appealReason,
      const DeepCollectionEquality().hash(attachments),
      createdAt,
      decisionReason,
      entityContent,
      entityId,
      entityType,
      id,
      status,
      updatedAt,
      user);

  @override
  String toString() {
    return 'AppealItemResponse(appealReason: $appealReason, attachments: $attachments, createdAt: $createdAt, decisionReason: $decisionReason, entityContent: $entityContent, entityId: $entityId, entityType: $entityType, id: $id, status: $status, updatedAt: $updatedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class $AppealItemResponseCopyWith<$Res> {
  factory $AppealItemResponseCopyWith(
          AppealItemResponse value, $Res Function(AppealItemResponse) _then) =
      _$AppealItemResponseCopyWithImpl;
  @useResult
  $Res call(
      {String appealReason,
      List<String>? attachments,
      DateTime createdAt,
      String? decisionReason,
      ModerationPayload? entityContent,
      String entityId,
      String entityType,
      String id,
      String status,
      DateTime updatedAt,
      UserResponse? user});
}

/// @nodoc
class _$AppealItemResponseCopyWithImpl<$Res>
    implements $AppealItemResponseCopyWith<$Res> {
  _$AppealItemResponseCopyWithImpl(this._self, this._then);

  final AppealItemResponse _self;
  final $Res Function(AppealItemResponse) _then;

  /// Create a copy of AppealItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appealReason = null,
    Object? attachments = freezed,
    Object? createdAt = null,
    Object? decisionReason = freezed,
    Object? entityContent = freezed,
    Object? entityId = null,
    Object? entityType = null,
    Object? id = null,
    Object? status = null,
    Object? updatedAt = null,
    Object? user = freezed,
  }) {
    return _then(AppealItemResponse(
      appealReason: null == appealReason
          ? _self.appealReason
          : appealReason // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      decisionReason: freezed == decisionReason
          ? _self.decisionReason
          : decisionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      entityContent: freezed == entityContent
          ? _self.entityContent
          : entityContent // ignore: cast_nullable_to_non_nullable
              as ModerationPayload?,
      entityId: null == entityId
          ? _self.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _self.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
    ));
  }
}

// dart format on
