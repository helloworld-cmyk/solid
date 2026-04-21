import '../models/product_detail_model.dart';
import '../models/review_model.dart';
import 'product_data_source.dart';

class ProductDataSourceImpl implements ProductDataSource {
  const ProductDataSourceImpl();

  static const String _fallbackPrimaryImage = 'assets/catagories/women.png';

  static const ProductDetailModel _baseProductDetail = ProductDetailModel(
    id: 'printed-cotton-shirt',
    name: 'Printed Cotton Shirt',
    price: 45,
    rating: 4.9,
    reviewCount: 12,
    soldLabel: 'Sold (50 Products)',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lectus urna duis convallis convallis tellus.',
    images: <String>[
      'assets/catagories/women.png',
      'assets/catagories/women.png',
      'assets/catagories/women.png',
    ],
    colorHexCodes: <int>[0xFFE5C8A6, 0xFF9E9E9E, 0xFF7AA5D2],
    sizes: <String>['S', 'M', 'L', 'XL'],
    detailedDescription:
        'Purus in massa tempor nec feugiat. Congue nisi vitae suscipit tellus mauris a diam. Nam aliquam sem et tortor. Quis risus sed vulputate odio ut enim. Ultrices dui sapien eget mi proin sed libero enim sed.\n\nQuis viverra nibh cras pulvinar mattis nunc sed blandit libero. At volutpat diam ut venenatis tellus in.',
    detailedDescriptionImages: <String>['assets/catagories/women.png'],
    reviews: <ReviewModel>[
      ReviewModel(
        userName: 'Theresa Webb',
        avatarPath: 'assets/catagories/women.png',
        rating: 5,
        date: 'May 1, 2022',
        comment:
            'Cursus sit amet dictum sit amet justo donec enim. Commaodo ullamcorper lacus.',
      ),
    ],
    relatedProducts: <RelatedProductModel>[
      RelatedProductModel(
        name: 'Women\'s Day T-shirt',
        price: 49,
        imagePath: 'assets/home/arrival2.png',
        soldLabel: 'Sold (50 Products)',
      ),
      RelatedProductModel(
        name: 'Long-sleeved T-shirt',
        price: 49,
        imagePath: 'assets/home/arrival1.png',
        soldLabel: 'Sold (50 Products)',
      ),
      RelatedProductModel(
        name: 'Long-sleeved T-shirt',
        price: 49,
        imagePath: 'assets/home/arrival1.png',
        soldLabel: 'Sold (50 Products)',
      ),
    ],
  );

  @override
  Future<ProductDetailModel> getProductDetail({
    String? image,
    String? title,
    double? price,
  }) async {
    final String resolvedTitle = _resolveDisplayTitle(
      fallbackTitle: _baseProductDetail.name,
      titleOverride: title,
    );
    final double resolvedPrice = price ?? _baseProductDetail.price;
    final List<String> resolvedImages = _resolveDisplayImages(
      defaultImages: _baseProductDetail.images,
      imageOverride: image,
    );

    final String primaryImage = resolvedImages.isEmpty
        ? _fallbackPrimaryImage
        : resolvedImages.first;

    final String resolvedId =
        '${resolvedTitle}_${resolvedPrice.toStringAsFixed(2)}_$primaryImage';

    return _baseProductDetail.copyWith(
      id: resolvedId,
      name: resolvedTitle,
      price: resolvedPrice,
      images: resolvedImages,
    );
  }

  String _resolveDisplayTitle({
    required String fallbackTitle,
    required String? titleOverride,
  }) {
    final String? trimmedTitle = titleOverride?.trim();
    if (trimmedTitle == null || trimmedTitle.isEmpty) {
      return fallbackTitle;
    }

    return trimmedTitle;
  }

  List<String> _resolveDisplayImages({
    required List<String> defaultImages,
    required String? imageOverride,
  }) {
    final String? trimmedImage = imageOverride?.trim();
    if (trimmedImage == null || trimmedImage.isEmpty) {
      return List<String>.from(defaultImages);
    }

    final List<String> orderedImages = <String>[trimmedImage];
    orderedImages.addAll(
      defaultImages.where((String imagePath) => imagePath != trimmedImage),
    );
    return orderedImages;
  }

  @override
  Future<void> submitReview({
    required String productId,
    required String review,
    required String name,
    required String email,
    required int rating,
    required bool saveDetails,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
  }
}
