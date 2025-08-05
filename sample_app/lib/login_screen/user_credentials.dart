import 'package:stream_feeds/stream_feeds.dart';
import 'demo_app_config.dart';

class UserCredentials {
  final User user;
  final String token;

  const UserCredentials({required this.user, required this.token});

  // Individual user credentials
  static final luke = UserCredentials(
    user: const User(
      id: 'luke_skywalker',
      name: 'Luke Skywalker',
      imageUrl:
          'https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg',
    ),
    token: DemoAppConfig.current.tokenForUser('luke_skywalker'),
  );

  static final martin = UserCredentials(
    user: const User(
      id: 'martin',
      name: 'Martin',
      imageUrl:
          "https://getstream.io/static/2796a305dd07651fcceb4721a94f4505/802d2/martin-mitrevski.webp",
    ),
    token: DemoAppConfig.current.tokenForUser('martin'),
  );

  static final tommaso = UserCredentials(
    user: const User(
      id: 'tommaso',
      name: 'Tommaso',
      imageUrl:
          'https://getstream.io/static/712bb5c0bd5ed8d3fa6e5842f6cfbeed/c59de/tommaso.webp',
    ),
    token: DemoAppConfig.current.tokenForUser('tommaso'),
  );

  static final thierry = UserCredentials(
    user: const User(
      id: 'thierry',
      name: 'Thierry',
      imageUrl:
          'https://getstream.io/static/237f45f28690696ad8fff92726f45106/c59de/thierry.webp',
    ),
    token: DemoAppConfig.current.tokenForUser('thierry'),
  );

  static final marcelo = UserCredentials(
    user: const User(
      id: 'marcelo',
      name: 'Marcelo',
      imageUrl:
          'https://getstream.io/static/aaf5fb17dcfd0a3dd885f62bd21b325a/802d2/marcelo-pires.webp',
    ),
    token: DemoAppConfig.current.tokenForUser('marcelo'),
  );

  static final kanat = UserCredentials(
    user: const User(id: 'kanat', name: 'Kanat'),
    token: DemoAppConfig.current.tokenForUser('kanat'),
  );

  static final toomas = UserCredentials(
    user: const User(id: 'toomas', name: 'Toomas'),
    token: DemoAppConfig.current.tokenForUser('toomas'),
  );

  // Built-in list sorted by name
  static List<UserCredentials> get builtIn => [
        luke,
        martin,
        tommaso,
        thierry,
        marcelo,
        kanat,
        toomas,
      ]..sort(
          (a, b) =>
              a.user.name.toLowerCase().compareTo(b.user.name.toLowerCase()),
        );

  // Helper method to get feed ID
  String get fid => 'user:${user.id}';

  // Helper method to get credentials by ID
  static UserCredentials credentialsFor(String id) {
    final found =
        builtIn.where((credentials) => credentials.user.id == id).firstOrNull;
    return found ?? tommaso;
  }
}
