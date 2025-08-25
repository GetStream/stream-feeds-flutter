import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart';

part 'events.freezed.dart';
part 'events.g.dart';

/// A WebSocket health check event for monitoring connection status.
///
/// Represents periodic health check messages sent by the Stream Feeds WebSocket service
/// to verify connection stability and provide real-time connection monitoring.
/// Contains connection metadata, user information, and custom data for diagnostics.
///
/// **Note:** This event is not specified in the OpenAPI spec, so we define it manually.
@freezed
@JsonSerializable()
class HealthCheckEvent extends WsEvent with _$HealthCheckEvent {
  /// Creates a new [HealthCheckEvent] instance.
  const HealthCheckEvent({
    this.cid,
    required this.connectionId,
    required this.createdAt,
    required this.custom,
    this.me,
    this.receivedAt,
    required this.type,
  });

  /// Optional channel identifier associated with the health check.
  @override
  final String? cid;

  /// The unique identifier for this WebSocket connection.
  @override
  final String connectionId;

  /// The date and time when the health check event was created.
  @override
  @EpochDateTimeConverter()
  final DateTime createdAt;

  /// Custom data associated with the health check event.
  @override
  final Map<String, Object?> custom;

  /// The current user information for this connection, if available.
  @override
  final OwnUserResponse? me;

  /// The date and time when the health check event was received, if available.
  @override
  @EpochDateTimeConverter()
  final DateTime? receivedAt;

  /// The event type identifier.
  @override
  @JsonKey(defaultValue: 'health.check')
  final String type;

  @override
  HealthCheckInfo get healthCheckInfo {
    return HealthCheckInfo(connectionId: connectionId);
  }

  Map<String, dynamic> toJson() => _$HealthCheckEventToJson(this);

  static HealthCheckEvent fromJson(Map<String, dynamic> json) =>
      _$HealthCheckEventFromJson(json);
}

/// A WebSocket event sent when the connection is established successfully.
///
/// Represents successful connection establishment to the Stream Feeds WebSocket service.
/// This event provides connection metadata and user information for the established session.
///
/// **Note:** This event is not specified in the OpenAPI spec, so we define it manually.
@freezed
@JsonSerializable(createToJson: false)
class ConnectedEvent extends WsEvent with _$ConnectedEvent {
  /// Creates a new [ConnectedEvent] instance.
  const ConnectedEvent({
    required this.connectionId,
    required this.createdAt,
    required this.me,
    required this.type,
  });

  /// The unique identifier for this connection.
  @override
  final String connectionId;

  /// The date and time when the connection was established.
  @override
  @EpochDateTimeConverter()
  final DateTime createdAt;

  /// The current user information for this connection.
  @override
  final OwnUserResponse me;

  /// The event type identifier.
  @override
  @JsonKey(defaultValue: 'connection.ok')
  final String type;

  /// Health check information for this connection.
  @override
  HealthCheckInfo get healthCheckInfo {
    return HealthCheckInfo(connectionId: connectionId);
  }

  /// Creates a [ConnectedEvent] from JSON data.
  static ConnectedEvent fromJson(Map<String, dynamic> json) =>
      _$ConnectedEventFromJson(json);
}

/// A WebSocket event sent when there is an error in the connection.
///
/// Represents connection errors and failures that occur during WebSocket communication
/// with the Stream Feeds service. Contains error details and connection context.
///
/// **Note:** This event is not specified in the OpenAPI spec, so we define it manually.
@freezed
@JsonSerializable()
class ConnectionErrorEvent extends WsEvent with _$ConnectionErrorEvent {
  /// Creates a new [ConnectionErrorEvent] instance.
  const ConnectionErrorEvent({
    required this.connectionId,
    required this.createdAt,
    required this.error,
    required this.type,
  });

  /// The unique identifier for this connection.
  @override
  final String connectionId;

  /// The date and time when the error occurred.
  @override
  @EpochDateTimeConverter()
  final DateTime createdAt;

  /// The error information describing what went wrong.
  @override
  final StreamApiError error;

  /// The event type identifier.
  @override
  @JsonKey(defaultValue: 'connection.error')
  final String type;

  /// Creates a [ConnectionErrorEvent] from JSON data.
  static ConnectionErrorEvent fromJson(Map<String, dynamic> json) =>
      _$ConnectionErrorEventFromJson(json);
}
