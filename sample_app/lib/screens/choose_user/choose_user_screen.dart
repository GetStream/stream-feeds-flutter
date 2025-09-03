import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/content/auth_controller.dart';
import '../../core/di/di_initializer.dart';
import '../../core/models/user_credentials.dart';
import '../../theme/extensions/theme_extensions.dart';
import '../../widgets/user_avatar.dart';

@RoutePage()
class ChooseUserScreen extends StatelessWidget {
  const ChooseUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 34),
            Center(
              child: SvgPicture.asset(
                'assets/images/app_logo.svg',
                height: 40,
                colorFilter: ColorFilter.mode(
                  context.appColors.accentPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome to Stream Feeds',
              style: context.appTextStyles.title,
            ),
            const SizedBox(height: 12),
            Text(
              'Select a user to try the Flutter SDK:',
              style: context.appTextStyles.body,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: UserSelectionList(
                onUserSelected: (credentials) {
                  final authController = locator<AuthController>();
                  return authController.connect(credentials).ignore();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserSelectionList extends StatelessWidget {
  const UserSelectionList({
    super.key,
    this.onUserSelected,
  });

  final ValueSetter<UserCredentials>? onUserSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: UserCredentials.builtIn.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: context.appColors.borders,
      ),
      itemBuilder: (context, index) {
        final credential = UserCredentials.builtIn[index];

        return ListTile(
          onTap: () => onUserSelected?.call(credential),
          visualDensity: VisualDensity.compact,
          leading: UserAvatar.listTile(user: credential.user),
          title: Text(
            credential.user.name,
            style: context.appTextStyles.bodyBold,
          ),
          subtitle: Text(
            'Stream test account',
            style: context.appTextStyles.footnote.copyWith(
              color: context.appColors.textLowEmphasis,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_rounded,
            color: context.appColors.accentPrimary,
          ),
        );
      },
    );
  }
}
