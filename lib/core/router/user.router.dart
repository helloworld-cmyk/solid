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
  AutoRoute(page: WishlistRoute.page, path: '/wishlist'),
  AutoRoute(page: ProductRoute.page, path: '/product'),
];
