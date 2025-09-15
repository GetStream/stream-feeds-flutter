import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/push_notifications_config.dart';

/// Repository for managing push devices associated with the current user.
///
/// Provides comprehensive device management including device registration,
/// querying registered devices, and device removal for push notifications.
///
/// All methods return [Result] objects for explicit error handling.
class DevicesRepository {
  /// Creates a new [DevicesRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const DevicesRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  /// Queries the push devices associated with the current user.
  ///
  /// Retrieves a list of all registered push notification devices for the authenticated user.
  ///
  /// Returns a [Result] containing a [api.ListDevicesResponse] with the list of devices, or an error.
  Future<Result<api.ListDevicesResponse>> queryDevices() => _api.listDevices();

  /// Creates a new push device for the current user with the specified ID and configuration.
  ///
  /// Registers a new device for push notifications using the provided device identifier
  /// and push notification provider configuration.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> createDevice(
    String id,
    PushNotificationsProvider pushProvider,
    String pushProviderName,
  ) {
    final request = api.CreateDeviceRequest(
      id: id,
      pushProvider: pushProvider.toRequest(),
      pushProviderName: pushProviderName,
    );

    return _api.createDevice(createDeviceRequest: request);
  }

  /// Deletes a push device associated with the current user.
  ///
  /// Removes the specified device from the user's registered push notification devices.
  ///
  /// Returns a [Result] indicating success or failure of the deletion operation.
  Future<Result<void>> deleteDevice(String id) => _api.deleteDevice(id: id);
}
