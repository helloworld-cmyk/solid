// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:solid/features/account/add_address/main.dart' as _i1;
import 'package:solid/features/account/add_payment_card/main.dart' as _i2;
import 'package:solid/features/account/address_list/main.dart' as _i3;
import 'package:solid/features/account/change_profile/main.dart' as _i6;
import 'package:solid/features/account/crop_avatar/main.dart' as _i9;
import 'package:solid/features/account/my_order/main.dart' as _i13;
import 'package:solid/features/account/payment_card_list/main.dart' as _i16;
import 'package:solid/features/account/profile/main.dart' as _i18;
import 'package:solid/features/auth/login/main.dart' as _i12;
import 'package:solid/features/auth/register/main.dart' as _i19;
import 'package:solid/features/catalog/catagories/main.dart' as _i5;
import 'package:solid/features/catalog/detail_catagories/main.dart' as _i10;
import 'package:solid/features/catalog/home/main.dart' as _i11;
import 'package:solid/features/catalog/product/main.dart' as _i17;
import 'package:solid/features/catalog/search/main.dart' as _i21;
import 'package:solid/features/catalog/search_filter/main.dart' as _i20;
import 'package:solid/features/commerce/cart/main.dart' as _i4;
import 'package:solid/features/commerce/checkout/main.dart' as _i7;
import 'package:solid/features/commerce/checkout_success/main.dart' as _i8;
import 'package:solid/features/notifications/notification_center/main.dart'
    as _i14;
import 'package:solid/features/onboarding/onboard/main.dart' as _i15;
import 'package:solid/features/onboarding/splash/main.dart' as _i22;
import 'package:solid/features/wishlist/wishlist/main.dart' as _i23;

/// generated route for
/// [_i1.AddAddressPage]
class AddAddressRoute extends _i24.PageRouteInfo<void> {
  const AddAddressRoute({List<_i24.PageRouteInfo>? children})
    : super(AddAddressRoute.name, initialChildren: children);

  static const String name = 'AddAddressRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddAddressPage();
    },
  );
}

/// generated route for
/// [_i2.AddPaymentCardPage]
class AddPaymentCardRoute extends _i24.PageRouteInfo<void> {
  const AddPaymentCardRoute({List<_i24.PageRouteInfo>? children})
    : super(AddPaymentCardRoute.name, initialChildren: children);

  static const String name = 'AddPaymentCardRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddPaymentCardPage();
    },
  );
}

/// generated route for
/// [_i3.AddressListPage]
class AddressListRoute extends _i24.PageRouteInfo<void> {
  const AddressListRoute({List<_i24.PageRouteInfo>? children})
    : super(AddressListRoute.name, initialChildren: children);

  static const String name = 'AddressListRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i3.AddressListPage();
    },
  );
}

/// generated route for
/// [_i4.CartPage]
class CartRoute extends _i24.PageRouteInfo<void> {
  const CartRoute({List<_i24.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i4.CartPage();
    },
  );
}

/// generated route for
/// [_i5.CatagoriesPage]
class CatagoriesRoute extends _i24.PageRouteInfo<CatagoriesRouteArgs> {
  CatagoriesRoute({
    _i25.Key? key,
    String? initialCategory,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         CatagoriesRoute.name,
         args: CatagoriesRouteArgs(key: key, initialCategory: initialCategory),
         initialChildren: children,
       );

  static const String name = 'CatagoriesRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CatagoriesRouteArgs>(
        orElse: () => const CatagoriesRouteArgs(),
      );
      return _i5.CatagoriesPage(
        key: args.key,
        initialCategory: args.initialCategory,
      );
    },
  );
}

class CatagoriesRouteArgs {
  const CatagoriesRouteArgs({this.key, this.initialCategory});

  final _i25.Key? key;

  final String? initialCategory;

  @override
  String toString() {
    return 'CatagoriesRouteArgs{key: $key, initialCategory: $initialCategory}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CatagoriesRouteArgs) return false;
    return key == other.key && initialCategory == other.initialCategory;
  }

  @override
  int get hashCode => key.hashCode ^ initialCategory.hashCode;
}

/// generated route for
/// [_i6.ChangeProfilePage]
class ChangeProfileRoute extends _i24.PageRouteInfo<void> {
  const ChangeProfileRoute({List<_i24.PageRouteInfo>? children})
    : super(ChangeProfileRoute.name, initialChildren: children);

  static const String name = 'ChangeProfileRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i6.ChangeProfilePage();
    },
  );
}

/// generated route for
/// [_i7.CheckoutPage]
class CheckoutRoute extends _i24.PageRouteInfo<void> {
  const CheckoutRoute({List<_i24.PageRouteInfo>? children})
    : super(CheckoutRoute.name, initialChildren: children);

  static const String name = 'CheckoutRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i7.CheckoutPage();
    },
  );
}

/// generated route for
/// [_i8.CheckoutSuccessPage]
class CheckoutSuccessRoute extends _i24.PageRouteInfo<void> {
  const CheckoutSuccessRoute({List<_i24.PageRouteInfo>? children})
    : super(CheckoutSuccessRoute.name, initialChildren: children);

  static const String name = 'CheckoutSuccessRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i8.CheckoutSuccessPage();
    },
  );
}

/// generated route for
/// [_i9.CropAvatarPage]
class CropAvatarRoute extends _i24.PageRouteInfo<CropAvatarRouteArgs> {
  CropAvatarRoute({
    _i25.Key? key,
    required String imagePath,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         CropAvatarRoute.name,
         args: CropAvatarRouteArgs(key: key, imagePath: imagePath),
         initialChildren: children,
       );

  static const String name = 'CropAvatarRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CropAvatarRouteArgs>();
      return _i9.CropAvatarPage(key: args.key, imagePath: args.imagePath);
    },
  );
}

class CropAvatarRouteArgs {
  const CropAvatarRouteArgs({this.key, required this.imagePath});

  final _i25.Key? key;

  final String imagePath;

  @override
  String toString() {
    return 'CropAvatarRouteArgs{key: $key, imagePath: $imagePath}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CropAvatarRouteArgs) return false;
    return key == other.key && imagePath == other.imagePath;
  }

  @override
  int get hashCode => key.hashCode ^ imagePath.hashCode;
}

/// generated route for
/// [_i10.DetailCatagoriesPage]
class DetailCatagoriesRoute
    extends _i24.PageRouteInfo<DetailCatagoriesRouteArgs> {
  DetailCatagoriesRoute({
    _i25.Key? key,
    required String categoryTitle,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         DetailCatagoriesRoute.name,
         args: DetailCatagoriesRouteArgs(
           key: key,
           categoryTitle: categoryTitle,
         ),
         initialChildren: children,
       );

  static const String name = 'DetailCatagoriesRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailCatagoriesRouteArgs>();
      return _i10.DetailCatagoriesPage(
        key: args.key,
        categoryTitle: args.categoryTitle,
      );
    },
  );
}

class DetailCatagoriesRouteArgs {
  const DetailCatagoriesRouteArgs({this.key, required this.categoryTitle});

  final _i25.Key? key;

  final String categoryTitle;

  @override
  String toString() {
    return 'DetailCatagoriesRouteArgs{key: $key, categoryTitle: $categoryTitle}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailCatagoriesRouteArgs) return false;
    return key == other.key && categoryTitle == other.categoryTitle;
  }

  @override
  int get hashCode => key.hashCode ^ categoryTitle.hashCode;
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i11.HomePage();
    },
  );
}

/// generated route for
/// [_i12.LoginPage]
class LoginRoute extends _i24.PageRouteInfo<void> {
  const LoginRoute({List<_i24.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i12.LoginPage();
    },
  );
}

/// generated route for
/// [_i13.MyOrderPage]
class MyOrderRoute extends _i24.PageRouteInfo<void> {
  const MyOrderRoute({List<_i24.PageRouteInfo>? children})
    : super(MyOrderRoute.name, initialChildren: children);

  static const String name = 'MyOrderRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i13.MyOrderPage();
    },
  );
}

/// generated route for
/// [_i14.NotificationCenterPage]
class NotificationCenterRoute extends _i24.PageRouteInfo<void> {
  const NotificationCenterRoute({List<_i24.PageRouteInfo>? children})
    : super(NotificationCenterRoute.name, initialChildren: children);

  static const String name = 'NotificationCenterRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i14.NotificationCenterPage();
    },
  );
}

/// generated route for
/// [_i15.OnboardPage]
class OnboardRoute extends _i24.PageRouteInfo<void> {
  const OnboardRoute({List<_i24.PageRouteInfo>? children})
    : super(OnboardRoute.name, initialChildren: children);

  static const String name = 'OnboardRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i15.OnboardPage();
    },
  );
}

/// generated route for
/// [_i16.PaymentCardListPage]
class PaymentCardListRoute extends _i24.PageRouteInfo<void> {
  const PaymentCardListRoute({List<_i24.PageRouteInfo>? children})
    : super(PaymentCardListRoute.name, initialChildren: children);

  static const String name = 'PaymentCardListRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i16.PaymentCardListPage();
    },
  );
}

/// generated route for
/// [_i17.ProductPage]
class ProductRoute extends _i24.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i25.Key? key,
    String? image,
    String? title,
    double? price,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         ProductRoute.name,
         args: ProductRouteArgs(
           key: key,
           image: image,
           title: title,
           price: price,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>(
        orElse: () => const ProductRouteArgs(),
      );
      return _i17.ProductPage(
        key: args.key,
        image: args.image,
        title: args.title,
        price: args.price,
      );
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({this.key, this.image, this.title, this.price});

  final _i25.Key? key;

  final String? image;

  final String? title;

  final double? price;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, image: $image, title: $title, price: $price}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductRouteArgs) return false;
    return key == other.key &&
        image == other.image &&
        title == other.title &&
        price == other.price;
  }

  @override
  int get hashCode =>
      key.hashCode ^ image.hashCode ^ title.hashCode ^ price.hashCode;
}

/// generated route for
/// [_i18.ProfilePage]
class ProfileRoute extends _i24.PageRouteInfo<void> {
  const ProfileRoute({List<_i24.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i18.ProfilePage();
    },
  );
}

/// generated route for
/// [_i19.RegisterPage]
class RegisterRoute extends _i24.PageRouteInfo<void> {
  const RegisterRoute({List<_i24.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i19.RegisterPage();
    },
  );
}

/// generated route for
/// [_i20.SearchFilterPage]
class SearchFilterRoute extends _i24.PageRouteInfo<void> {
  const SearchFilterRoute({List<_i24.PageRouteInfo>? children})
    : super(SearchFilterRoute.name, initialChildren: children);

  static const String name = 'SearchFilterRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i20.SearchFilterPage();
    },
  );
}

/// generated route for
/// [_i21.SearchPage]
class SearchRoute extends _i24.PageRouteInfo<void> {
  const SearchRoute({List<_i24.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i21.SearchPage();
    },
  );
}

/// generated route for
/// [_i22.SplashPage]
class SplashRoute extends _i24.PageRouteInfo<void> {
  const SplashRoute({List<_i24.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i22.SplashPage();
    },
  );
}

/// generated route for
/// [_i23.WishlistPage]
class WishlistRoute extends _i24.PageRouteInfo<void> {
  const WishlistRoute({List<_i24.PageRouteInfo>? children})
    : super(WishlistRoute.name, initialChildren: children);

  static const String name = 'WishlistRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i23.WishlistPage();
    },
  );
}
