import 'package:collection/collection.dart';
import 'package:stream_feed/stream_feed.dart';

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

  static final luke = UserCredentials(
    user: const User(
      id: 'luke_skywalker',
      name: 'Luke Skywalker',
      image:
          'https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg',
    ),
    token: _tokenForUser('luke_skywalker'),
  );

  static final martin = UserCredentials(
    user: const User(
      id: 'martin',
      name: 'Martin',
      image:
          'https://getstream.io/static/2796a305dd07651fcceb4721a94f4505/802d2/martin-mitrevski.webp',
    ),
    token: _tokenForUser('martin'),
  );

  static final tommaso = UserCredentials(
    user: const User(
      id: 'tommaso',
      name: 'Tommaso',
      image:
          'https://getstream.io/static/712bb5c0bd5ed8d3fa6e5842f6cfbeed/c59de/tommaso.webp',
    ),
    token: _tokenForUser('tommaso'),
  );

  static final thierry = UserCredentials(
    user: const User(
      id: 'thierry',
      name: 'Thierry',
      image:
          'https://getstream.io/static/237f45f28690696ad8fff92726f45106/c59de/thierry.webp',
    ),
    token: _tokenForUser('thierry'),
  );

  static final marcelo = UserCredentials(
    user: const User(
      id: 'marcelo',
      name: 'Marcelo',
      image:
          'https://getstream.io/static/aaf5fb17dcfd0a3dd885f62bd21b325a/802d2/marcelo-pires.webp',
    ),
    token: _tokenForUser('marcelo'),
  );

  static final kanat = UserCredentials(
    user: const User(id: 'kanat', name: 'Kanat'),
    token: _tokenForUser('kanat'),
  );

  static final toomas = UserCredentials(
    user: const User(id: 'toomas', name: 'Toomas'),
    token: _tokenForUser('toomas'),
  );

  // endregion

  // Built-in list sorted by name
  static List<UserCredentials> get builtIn {
    final users = [luke, martin, tommaso, thierry, marcelo, kanat, toomas];
    return users.sorted(
      (a, b) => a.user.name.toLowerCase().compareTo(b.user.name.toLowerCase()),
    );
  }

  // Helper method to get credentials by ID
  static UserCredentials credentialsFor(String id) {
    return builtIn.firstWhere((it) => it.user.id == id, orElse: () => tommaso);
  }
}
