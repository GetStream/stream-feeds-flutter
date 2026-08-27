import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;

/// Repository for creating guest users.
///
/// Provides guest creation, which issues a guest identity along with the token that
/// authenticates it.
///
/// All methods return [Result] objects for explicit error handling.
class GuestRepository {
  /// Creates a new [GuestRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const GuestRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  /// Creates a guest user, returning the identity and the token that authenticates it.
  ///
  /// The returned user is not [requested]: its id is assigned rather than accepted, and its role
  /// is always `guest`. Every call creates another guest, so call it once and keep the result.
  ///
  /// Returns a [Result] containing the guest user and its token, or an error.
  Future<Result<({User user, UserToken token})>> createGuest(
    User requested,
  ) async {
    final result = await _api.createGuest(
      createGuestRequest: api.CreateGuestRequest(
        user: api.UserRequest(
          id: requested.id,
          name: requested.originalName,
          image: requested.image,
          custom: requested.custom.takeIf((it) => it.isNotEmpty),
        ),
      ),
    );

    return result.mapCatching((response) {
      final user = User(
        id: response.user.id,
        name: response.user.name,
        image: response.user.image,
        role: response.user.role,
        type: UserType.guest,
        custom: response.user.custom,
        teams: response.user.teams,
      );

      return (user: user, token: UserToken(response.accessToken));
    });
  }
}
