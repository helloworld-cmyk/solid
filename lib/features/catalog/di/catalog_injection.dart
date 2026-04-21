import 'package:get_it/get_it.dart';

import '../catagories/di/catagories_injection.dart';
import '../detail_catagories/di/detail_catagories_injection.dart';
import '../home/di/home_injection.dart';
import '../product/di/product_injection.dart';
import '../search/di/search_injection.dart';
import '../search_filter/di/search_filter_injection.dart';

class CatalogInjection {
  const CatalogInjection._();

  static void register(GetIt getIt) {
    HomeInjection.register(getIt);
    CatagoriesInjection.register(getIt);
    DetailCatagoriesInjection.register(getIt);
    SearchInjection.register(getIt);
    SearchFilterInjection.register(getIt);
    ProductInjection.register(getIt);
  }
}
