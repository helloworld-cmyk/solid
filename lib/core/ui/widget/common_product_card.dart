import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonProductCard extends StatelessWidget {
  const CommonProductCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.soldLabel,
    required this.priceText,
    this.originalPriceText,
    this.isAsset = true,
    this.onTap,
  });

  final String imagePath;
  final String name;
  final String soldLabel;
  final String priceText;
  final String? originalPriceText;
  final bool isAsset;
  final VoidCallback? onTap;

  static const double _aspectRatio = 157 / 172;
  static const Color _imageBackgroundColor = Color(0xFFF5F5F5);
  static const Color _imageErrorIconColor = Color(0xFF999999);
  static const double _soldNameSpacing = 6;
  static const double _imageSoldSpacing = 12;
  static const double _namePriceSpacing = 8;
  static const int _nameMaxLines = 1;
  static const Color _soldLabelColor = Color(0xFF666666);
  static const Color _nameColor = Color(0xFF000000);
  static const Color _priceColor = Color(0xFFFF6A2B);

  @override
  Widget build(BuildContext context) {
    final TextStyle soldLabelStyle = GoogleFonts.poppins(
      color: _soldLabelColor,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    );
    final TextStyle nameStyle = GoogleFonts.poppins(
      color: _nameColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    );
    final TextStyle priceStyle = GoogleFonts.poppins(
      color: _priceColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    );
    final TextStyle originalPriceStyle = GoogleFonts.poppins(
      color: _soldLabelColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
      decoration: TextDecoration.lineThrough,
    );

    final Widget imageWidget = isAsset
        ? Image.asset(
            imagePath,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (_, _, _) =>
                Icon(Icons.image_outlined, color: _imageErrorIconColor),
          )
        : Image.network(
            imagePath,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (_, _, _) =>
                Icon(Icons.image_outlined, color: _imageErrorIconColor),
          );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: _aspectRatio,
              child: DecoratedBox(
                decoration: BoxDecoration(color: _imageBackgroundColor),
                child: imageWidget,
              ),
            ),
            SizedBox(height: _imageSoldSpacing),
            Text(
              soldLabel,
              style: soldLabelStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: _soldNameSpacing),
            Text(
              name,
              style: nameStyle,
              maxLines: _nameMaxLines,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: _namePriceSpacing),
            Row(
              children: <Widget>[
                Text(priceText, style: priceStyle),
                if (originalPriceText?.isNotEmpty ?? false) ...<Widget>[
                  const SizedBox(width: 8),
                  Text(originalPriceText!, style: originalPriceStyle),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
