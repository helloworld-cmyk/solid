import '../models/search_content_model.dart';

abstract class SearchDataSource {
  Future<SearchContentModel> getSearchContent();
}
