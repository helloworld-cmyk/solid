import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';
import 'package:solid/core/ui/widget/widgets.dart';
import 'package:solid/features/commerce/cart/domain/entities/cart_suggestion_product.dart';
import 'package:solid/features/commerce/cart/domain/usecases/get_cart_suggestions_usecase.dart';

class YouAlsoViewedSection extends StatelessWidget {
  const YouAlsoViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartSuggestionProduct> products =
        sl<GetCartSuggestionsUseCase>()();

    return CommonProductGridSection(
      title: 'YOU ALSO VIEWED',
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final CartSuggestionProduct product = products[index];

        return CommonProductCard(
          imagePath: product.image,
          name: product.name,
          soldLabel: 'Sold (50 Products)',
          priceText: product.priceText,
          isAsset: true,
          onTap: () {
            context.router.push(
              ProductRoute(
                image: product.image,
                title: product.name,
                price: product.priceValue,
              ),
            );
          },
        );
      },
    );
  }
}
