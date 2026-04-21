import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';

import 'domain/entities/product_detail.dart';
import 'domain/usecases/get_product_detail_usecase.dart';
import 'presentation/widgets/expandable_description.dart';
import 'presentation/widgets/product_image_resolver.dart';
import 'presentation/widgets/product_colors.dart';
import 'presentation/widgets/product_image_carousel.dart';
import 'presentation/widgets/product_info_header.dart';
import 'presentation/widgets/product_load_error.dart';
import 'presentation/widgets/related_products.dart';
import 'presentation/widgets/reviews_section.dart';
import 'presentation/widgets/selection_options.dart';
import 'presentation/widgets/sticky_bottom_bar.dart';

@RoutePage()
class ProductPage extends StatelessWidget {
  const ProductPage({super.key, this.image, this.title, this.price});

  final String? image;
  final String? title;
  final double? price;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      child: FutureBuilder<ProductDetail>(
        future: sl<GetProductDetailUseCase>()(
          image: image,
          title: title,
          price: price,
        ),
        builder: (BuildContext context, AsyncSnapshot<ProductDetail> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: ProductColors.white,
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return Scaffold(
              backgroundColor: ProductColors.white,
              body: ProductLoadError(
                onRetry: () {
                  context.router.replace(
                    ProductRoute(image: image, title: title, price: price),
                  );
                },
              ),
            );
          }

          final ProductDetail displayProduct = snapshot.data!;
          final List<String> carouselImages =
              ProductImageResolver.resolveCarouselImages(displayProduct.images);
          final String primaryImage = ProductImageResolver.resolvePrimaryImage(
            displayProduct.images,
          );

          return Scaffold(
            backgroundColor: ProductColors.white,
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProductImageCarousel(
                        images: carouselImages,
                        onBackTap: () => context.router.maybePop(),
                      ),
                      const SizedBox(height: 24),
                      ProductInfoHeader(
                        name: displayProduct.name,
                        rating: displayProduct.rating,
                        reviewCount: displayProduct.reviewCount,
                        soldLabel: displayProduct.soldLabel,
                        description: displayProduct.description,
                      ),
                      const SizedBox(height: 24),
                      SelectionOptions(
                        colorHexCodes: displayProduct.colorHexCodes,
                        sizes: displayProduct.sizes,
                      ),
                      const SizedBox(height: 40),
                      ExpandableDescription(
                        description: displayProduct.detailedDescription,
                        detailImages: displayProduct.detailedDescriptionImages,
                      ),
                      const SizedBox(height: 48),
                      ReviewsSection(
                        productId: displayProduct.id,
                        productName: displayProduct.name,
                        reviews: displayProduct.reviews,
                      ),
                      const SizedBox(height: 60),
                      RelatedProducts(
                        products: displayProduct.relatedProducts,
                        onProductTap: (RelatedProduct product) {
                          context.router.push(
                            ProductRoute(
                              image: product.imagePath,
                              title: product.name,
                              price: product.price,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: StickyBottomBar(
                    id: displayProduct.id,
                    name: displayProduct.name,
                    image: primaryImage,
                    price: displayProduct.price,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
