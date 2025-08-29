import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../navigation/app_state.dart';
import 'user_credentials.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Stream Feeds')),
      body: ListView(
        children: [
          const Text(
            'Select a user to try the Flutter SDK',
            textAlign: TextAlign.center,
          ),
          ...UserCredentials.builtIn
              .map(
                (credentials) => [
                  _LoginUserListItem(
                    credentials,
                    onTap: () {
                      GetIt.instance
                          .get<AppStateProvider>()
                          .setUser(credentials);
                    },
                  ),
                  const Divider(),
                ],
              )
              .expand((e) => e),
        ],
      ),
    );
  }
}

class _LoginUserListItem extends StatelessWidget {
  const _LoginUserListItem(this.credentials, {required this.onTap});

  final UserCredentials credentials;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: switch (credentials.user.image) {
          final String image => CachedNetworkImageProvider(image),
          _ => null,
        },
        child: switch (credentials.user.image) {
          String _ => null,
          _ => _LoginUserListItemPlaceholder(credentials),
        },
      ),
      title: Text(credentials.user.name),
      subtitle: const Text('Stream test account'),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}

class _LoginUserListItemPlaceholder extends StatelessWidget {
  const _LoginUserListItemPlaceholder(this.credentials);
  final UserCredentials credentials;

  @override
  Widget build(BuildContext context) {
    return Text(credentials.user.name.substring(0, 1).toUpperCase());
  }
}
