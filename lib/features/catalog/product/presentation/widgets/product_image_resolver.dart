class ProductImageResolver {
  const ProductImageResolver._();

  static const String fallbackAsset = 'assets/catagories/women.png';

  static List<String> resolveCarouselImages(List<String> images) {
    if (images.isEmpty) {
      return const <String>[fallbackAsset];
    }

    return images;
  }

  static String resolvePrimaryImage(List<String> images) {
    return resolveCarouselImages(images).first;
  }
}
