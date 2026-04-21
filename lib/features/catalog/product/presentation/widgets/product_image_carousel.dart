import 'package:flutter/material.dart';

import 'product_colors.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({
    super.key,
    required this.images,
    required this.onBackTap,
  });

  final List<String> images;
  final VoidCallback onBackTap;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool hasImages = widget.images.isNotEmpty;

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 375 / 427,
          child: hasImages
              ? PageView.builder(
                  itemCount: widget.images.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      widget.images[index],
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (_, _, _) => const Center(
                        child: Icon(
                          Icons.image_outlined,
                          color: ProductColors.lightGray,
                          size: 36,
                        ),
                      ),
                    );
                  },
                )
              : const DecoratedBox(
                  decoration: BoxDecoration(color: ProductColors.background),
                  child: Center(
                    child: Icon(
                      Icons.image_outlined,
                      color: ProductColors.lightGray,
                      size: 36,
                    ),
                  ),
                ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: widget.onBackTap,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: ProductColors.black,
                      size: 24,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: ProductColors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: ProductColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (hasImages)
          Positioned(
            bottom: 20,
            right: 20,
            child: Row(
              children: List<Widget>.generate(
                widget.images.length,
                (int index) => Container(
                  margin: const EdgeInsets.only(left: 6),
                  width: index == _currentIndex ? 12 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: index == _currentIndex
                        ? ProductColors.primary
                        : ProductColors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
