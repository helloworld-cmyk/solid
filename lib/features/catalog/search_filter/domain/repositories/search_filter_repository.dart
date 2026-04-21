import '../entities/search_filter.dart';

abstract class SearchFilterRepository {
  Future<SearchFilter> getSearchFilter();
}