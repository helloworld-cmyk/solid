import 'package:auto_route/auto_route.dart';

import 'app.router.gr.dart';

final List<AutoRoute> authRoutes = [
  AutoRoute(page: SplashRoute.page, path: '/splash', initial: true),
  AutoRoute(page: OnboardRoute.page, path: '/onboard'),
  AutoRoute(page: LoginRoute.page, path: '/login'),
  AutoRoute(page: RegisterRoute.page, path: '/register'),
];
