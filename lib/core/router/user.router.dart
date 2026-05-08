import 'package:auto_route/auto_route.dart';

import 'app.router.gr.dart';

final List<AutoRoute> userRoutes = [
  AutoRoute(page: HomeRoute.page, path: '/home', initial: true),
  AutoRoute(page: CartRoute.page, path: '/cart'),
  AutoRoute(page: CheckoutRoute.page, path: '/checkout'),
  AutoRoute(page: CheckoutSuccessRoute.page, path: '/checkout/success'),
  AutoRoute(page: CatagoriesRoute.page, path: '/catagories'),
  AutoRoute(page: DetailCatagoriesRoute.page, path: '/catagories/detail'),
  AutoRoute(page: SearchRoute.page, path: '/search'),
  AutoRoute(page: SearchFilterRoute.page, path: '/search/filter'),
  AutoRoute(page: NotificationCenterRoute.page, path: '/notifications'),
  AutoRoute(page: ProfileRoute.page, path: '/profile'),
  AutoRoute(page: ChangeProfileRoute.page, path: '/profile/change'),
  AutoRoute(page: CropAvatarRoute.page, path: '/profile/avatar-crop'),
  AutoRoute(page: AddressListRoute.page, path: '/profile/address'),
  AutoRoute(page: AddAddressRoute.page, path: '/profile/address/add'),
  AutoRoute(page: PaymentCardListRoute.page, path: '/profile/payment-card'),
  AutoRoute(page: AddPaymentCardRoute.page, path: '/profile/payment-card/add'),
  AutoRoute(page: MyOrderRoute.page, path: '/profile/my-order'),
  AutoRoute(page: WishlistRoute.page, path: '/wishlist'),
  AutoRoute(page: ProductRoute.page, path: '/product'),
];
