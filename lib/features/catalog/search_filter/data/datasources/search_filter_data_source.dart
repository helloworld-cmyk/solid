import '../models/search_filter_model.dart';

abstract class SearchFilterDataSource {
  Future<SearchFilterModel> getSearchFilter();
}