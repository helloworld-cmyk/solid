import 'review.dart';

class ProductDetail {
  const ProductDetail({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.soldLabel,
    required this.description,
    required this.images,
    required this.colorHexCodes,
    required this.sizes,
    required this.detailedDescription,
    required this.detailedDescriptionImages,
    required this.reviews,
    required this.relatedProducts,
  });

  final String id;
  final String name;
  final double price;
  final double rating;
  final int reviewCount;
  final String soldLabel;
  final String description;
  final List<String> images;
  final List<int> colorHexCodes;
  final List<String> sizes;
  final String detailedDescription;
  final List<String> detailedDescriptionImages;
  final List<Review> reviews;
  final List<RelatedProduct> relatedProducts;

  ProductDetail copyWith({
    String? id,
    String? name,
    double? price,
    double? rating,
    int? reviewCount,
    String? soldLabel,
    String? description,
    List<String>? images,
    List<int>? colorHexCodes,
    List<String>? sizes,
    String? detailedDescription,
    List<String>? detailedDescriptionImages,
    List<Review>? reviews,
    List<RelatedProduct>? relatedProducts,
  }) {
    return ProductDetail(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      soldLabel: soldLabel ?? this.soldLabel,
      description: description ?? this.description,
      images: images ?? this.images,
      colorHexCodes: colorHexCodes ?? this.colorHexCodes,
      sizes: sizes ?? this.sizes,
      detailedDescription: detailedDescription ?? this.detailedDescription,
      detailedDescriptionImages:
          detailedDescriptionImages ?? this.detailedDescriptionImages,
      reviews: reviews ?? this.reviews,
      relatedProducts: relatedProducts ?? this.relatedProducts,
    );
  }
}

class RelatedProduct {
  const RelatedProduct({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.soldLabel,
    this.isAsset = true,
  });

  final String name;
  final double price;
  final String imagePath;
  final String soldLabel;
  final bool isAsset;
}
