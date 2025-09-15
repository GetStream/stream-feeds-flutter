import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/models/user_credentials.dart';

@lazySingleton
class AppPreferences {
  const AppPreferences(this._prefs);

  final SharedPreferences _prefs;

  static const _themeModeKey = 'theme_mode';
  static const _loggedUserId = 'logged_user_id';

  int getThemeMode() => _prefs.getInt(_themeModeKey) ?? 0;

  Future<bool> setThemeMode(int mode) => _prefs.setInt(_themeModeKey, mode);

  UserCredentials? getUserCredentials() {
    final userId = _prefs.getString(_loggedUserId);
    if (userId == null) return null;

    final builtInUsers = UserCredentials.builtIn;
    return builtInUsers.firstWhereOrNull((it) => it.user.id == userId);
  }

  Future<bool> storeUserCredentials(UserCredentials credentials) {
    return _prefs.setString(_loggedUserId, credentials.user.id);
  }

  Future<bool> clearUserCredentials() => _prefs.remove(_loggedUserId);
}
