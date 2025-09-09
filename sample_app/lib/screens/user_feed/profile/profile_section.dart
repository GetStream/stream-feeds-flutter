import 'package:flutter/material.dart';

import '../../../theme/extensions/theme_extensions.dart';

class ProfileSection<T> extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.title,
    required this.items,
    required this.emptyMessage,
    required this.itemBuilder,
  });

  final String title;
  final List<T> items;
  final String emptyMessage;
  final Widget Function(T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        _SectionHeader(
          title: title,
          count: items.length,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: context.appColors.borders),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Builder(
            builder: (context) {
              if (items.isEmpty) {
                return _EmptyStateMessage(message: emptyMessage);
              }

              return MediaQuery.removePadding(
                context: context,
                // Workaround for the bottom padding issue.
                // Link: https://github.com/flutter/flutter/issues/156149
                removeTop: true,
                removeBottom: true,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: items.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return itemBuilder(item);
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: context.appColors.borders,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.appTextStyles.headlineBold,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: context.appColors.borders,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$count',
            style: context.appTextStyles.footnoteBold,
          ),
        ),
      ],
    );
  }
}

class _EmptyStateMessage extends StatelessWidget {
  const _EmptyStateMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Text(
          message,
          style: context.appTextStyles.footnote.copyWith(
            color: context.appColors.textLowEmphasis,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
