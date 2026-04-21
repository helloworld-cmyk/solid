import 'package:auto_route/auto_route.dart';

import 'auth.router.dart';
import 'user.router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter({required this.isAuthenticated});

  final bool isAuthenticated;

  @override
  List<AutoRoute> get routes =>
    isAuthenticated ? [...userRoutes] : [...authRoutes];
}
