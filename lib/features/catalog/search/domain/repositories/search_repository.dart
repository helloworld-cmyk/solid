import '../entities/search_content.dart';

abstract class SearchRepository {
  Future<SearchContent> getSearchContent();
}
