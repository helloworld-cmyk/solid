import 'dart:io';

import 'package:flutter/material.dart';

class CommonAvatarImage extends StatelessWidget {
  const CommonAvatarImage({
    super.key,
    required this.avatarPath,
    required this.size,
    required this.fallbackIconColor,
    required this.fallbackIconSize,
    this.backgroundColor = const Color(0xFFF0F0F0),
  });

  final String avatarPath;
  final double size;
  final Color fallbackIconColor;
  final double fallbackIconSize;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(width: size, height: size, child: _buildImage()),
    );
  }

  Widget _buildImage() {
    final String path = avatarPath.trim();
    if (path.isEmpty) {
      return _buildFallback();
    }

    if (path.startsWith('assets/')) {
      return Image.asset(
        path,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _buildFallback(),
      );
    }

    if (path.startsWith('http://') || path.startsWith('https://')) {
      return Image.network(
        path,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _buildFallback(),
      );
    }

    if (path.startsWith('file://')) {
      return Image.file(
        File.fromUri(Uri.parse(path)),
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _buildFallback(),
      );
    }

    return Image.file(
      File(path),
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => _buildFallback(),
    );
  }

  Widget _buildFallback() {
    return Container(
      color: backgroundColor,
      alignment: Alignment.center,
      child: Icon(
        Icons.person,
        color: fallbackIconColor,
        size: fallbackIconSize,
      ),
    );
  }
}
