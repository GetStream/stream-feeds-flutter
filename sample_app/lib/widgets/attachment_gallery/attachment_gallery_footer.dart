import 'package:flutter/material.dart';

import '../../theme/extensions/theme_extensions.dart';

class AttachmentGalleryFooter extends StatelessWidget {
  const AttachmentGalleryFooter({
    super.key,
    required this.currentIndex,
    required this.totalCount,
  });

  final int currentIndex;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        height: kToolbarHeight,
        child: Center(
          child: Chip(
            label: Text('$currentIndex / $totalCount'),
            labelStyle: context.appTextStyles.body,
            backgroundColor: context.appColors.barsBg,
            avatar: const Icon(Icons.photo_library_outlined),
            iconTheme: IconThemeData(color: context.appColors.textHighEmphasis),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: context.appColors.borders),
            ),
          ),
        ),
      ),
    );
  }
}
