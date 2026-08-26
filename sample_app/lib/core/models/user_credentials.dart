import 'package:stream_feeds/stream_feeds.dart';

import '../../config/demo_app_config.dart';

class UserCredentials {
  const UserCredentials({
    required this.user,
    this.token,
  });

  final User user;

  /// The JWT to authenticate [user] with, or `null` for a guest or anonymous
  /// user, whose credentials the client obtains for itself.
  final String? token;

  // Helper method to get feed ID
  String get fid => 'user:${user.id}';

  static String _tokenForUser(String userId) {
    return DemoAppConfig.current.tokenForUser(userId);
  }

  // region Individual user credentials

  static final sahil = UserCredentials(
    user: const User(
      id: 'sahil',
      name: 'Sahil Kumar',
      image: 'https://avatars.githubusercontent.com/u/25670178',
    ),
    token: _tokenForUser('sahil'),
  );

  static final rene = UserCredentials(
    user: const User(
      id: 'rene',
      name: 'Rene Floor',
      image: 'https://avatars.githubusercontent.com/u/15101411',
    ),
    token: _tokenForUser('rene'),
  );

  static final maciej = UserCredentials(
    user: const User(
      id: 'maciej',
      name: 'Maciej Brażewicz',
      image: 'https://avatars.githubusercontent.com/u/5622717',
    ),
    token: _tokenForUser('maciej'),
  );

  static final martin = UserCredentials(
    user: const User(
      id: 'martin',
      name: 'Martin Mitrevski',
      image: 'https://avatars.githubusercontent.com/u/2971717',
    ),
    token: _tokenForUser('martin'),
  );

  static final tommaso = UserCredentials(
    user: const User(
      id: 'tommaso',
      name: 'Tommaso Barbugli',
      image: 'https://avatars.githubusercontent.com/u/88735',
    ),
    token: _tokenForUser('tommaso'),
  );

  static final thierry = UserCredentials(
    user: const User(
      id: 'thierry',
      name: 'Thierry Schellenbach',
      image: 'https://avatars.githubusercontent.com/u/265409',
    ),
    token: _tokenForUser('thierry'),
  );

  static final marcelo = UserCredentials(
    user: const User(
      id: 'marcelo',
      name: 'Marcelo Pires',
      image: 'https://avatars.githubusercontent.com/u/916501',
    ),
    token: _tokenForUser('marcelo'),
  );

  static final kanat = UserCredentials(
    user: const User(
      id: 'kanat',
      name: 'Kanat Kiialbaev',
      image: 'https://avatars.githubusercontent.com/u/1286516',
    ),
    token: _tokenForUser('kanat'),
  );

  static final toomas = UserCredentials(
    user: const User(
      id: 'toomas',
      name: 'Toomas Vahter',
      image: 'https://avatars.githubusercontent.com/u/1469907',
    ),
    token: _tokenForUser('toomas'),
  );

  // endregion

  // region Session modes

  /// A guest, which the server issues a temporary identity and JWT for during
  /// `connect()`. The id below is only what is asked for: the server assigns its
  /// own, so `client.user.id` is the one to read afterwards.
  static const guest = UserCredentials(
    user: User.guest(
      'guest',
      name: 'Guest User',
      image: 'https://getstream.io/random_png/?id=guest&name=Guest+User',
    ),
  );

  // endregion

  // Built-in list sorted by name, with the token-less identity last so the test
  // accounts stay the obvious choice.
  static List<UserCredentials> get builtIn {
    final users = [
      sahil,
      rene,
      maciej,
      martin,
      tommaso,
      thierry,
      marcelo,
      kanat,
      toomas,
      guest,
    ];

    return users;
  }

  // Helper method to get credentials by ID
  static UserCredentials credentialsFor(String id) {
    return builtIn.firstWhere((it) => it.user.id == id, orElse: () => tommaso);
  }
}
