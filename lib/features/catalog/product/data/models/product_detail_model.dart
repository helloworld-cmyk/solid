import '../../domain/entities/product_detail.dart';
import 'review_model.dart';

class ProductDetailModel {
  const ProductDetailModel({
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
  final List<ReviewModel> reviews;
  final List<RelatedProductModel> relatedProducts;

  ProductDetailModel copyWith({
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
    List<ReviewModel>? reviews,
    List<RelatedProductModel>? relatedProducts,
  }) {
    return ProductDetailModel(
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

  ProductDetail toEntity() {
    return ProductDetail(
      id: id,
      name: name,
      price: price,
      rating: rating,
      reviewCount: reviewCount,
      soldLabel: soldLabel,
      description: description,
      images: images,
      colorHexCodes: colorHexCodes,
      sizes: sizes,
      detailedDescription: detailedDescription,
      detailedDescriptionImages: detailedDescriptionImages,
      reviews: reviews.map((ReviewModel model) => model.toEntity()).toList(),
      relatedProducts: relatedProducts
          .map((RelatedProductModel model) => model.toEntity())
          .toList(),
    );
  }
}

class RelatedProductModel {
  const RelatedProductModel({
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

  RelatedProduct toEntity() {
    return RelatedProduct(
      name: name,
      price: price,
      imagePath: imagePath,
      soldLabel: soldLabel,
      isAsset: isAsset,
    );
  }
}
