import 'package:stream_feeds/stream_feeds.dart';

import '../../config/demo_app_config.dart';

class UserCredentials {
  const UserCredentials({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

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

  // Built-in list sorted by name
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
    ];

    return users;
  }

  // Helper method to get credentials by ID
  static UserCredentials credentialsFor(String id) {
    return builtIn.firstWhere((it) => it.user.id == id, orElse: () => tommaso);
  }
}
