import 'dart:io';

import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';

import '../../crop_avatar_style.dart';

class CropAvatarBody extends StatelessWidget {
  const CropAvatarBody({
    super.key,
    required this.imagePath,
    required this.controller,
  });

  final String imagePath;
  final CropController controller;

  @override
  Widget build(BuildContext context) {
    final String path = imagePath.trim();
    if (path.isEmpty) {
      return const _CropAvatarEmptyState();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                color: CropAvatarColors.cropBackground,
                child: CropImage(
                  controller: controller,
                  image: Image.file(File(path)),
                  paddingSize: 12,
                  alwaysShowThirdLines: true,
                  scrimColor: CropAvatarColors.cropScrim,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Drag and zoom to adjust the crop.',
            style: CropAvatarTypography.caption,
          ),
        ],
      ),
    );
  }
}

class _CropAvatarEmptyState extends StatelessWidget {
  const _CropAvatarEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No image selected.',
        style: CropAvatarTypography.caption,
      ),
    );
  }
}
