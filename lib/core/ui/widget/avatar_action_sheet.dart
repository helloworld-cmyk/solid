import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Future<void> showAvatarActionSheet(
  BuildContext context, {
  VoidCallback? onCameraTap,
  VoidCallback? onGalleryTap,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Theme.of(context).colorScheme.surface,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (BuildContext context) {
      return AvatarActionSheet(
        onCameraTap: onCameraTap,
        onGalleryTap: onGalleryTap,
      );
    },
  );
}

class AvatarActionSheet extends StatelessWidget {
  const AvatarActionSheet({
    super.key,
    this.title = 'Update photo',
    this.cameraLabel = 'Take a photo',
    this.galleryLabel = 'Choose from library',
    this.onCameraTap,
    this.onGalleryTap,
  });

  final String title;
  final String cameraLabel;
  final String galleryLabel;
  final VoidCallback? onCameraTap;
  final VoidCallback? onGalleryTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color dividerColor = Theme.of(context).dividerColor;
    final Color iconColor = Theme.of(context).colorScheme.onSurface;

    final TextStyle titleStyle =
        textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600) ??
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

    final TextStyle itemStyle =
        textTheme.bodyMedium ?? const TextStyle(fontSize: 14);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: dividerColor,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            const SizedBox(height: 12),
            Text(title, style: titleStyle),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              leading: Icon(Icons.photo_camera_outlined, color: iconColor),
              title: Text(cameraLabel, style: itemStyle),
              onTap: () {
                onCameraTap?.call();
                context.router.maybePop();
              },
            ),
            Divider(color: dividerColor, height: 1),
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              leading: Icon(Icons.photo_library_outlined, color: iconColor),
              title: Text(galleryLabel, style: itemStyle),
              onTap: () {
                onGalleryTap?.call();
                context.router.maybePop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
