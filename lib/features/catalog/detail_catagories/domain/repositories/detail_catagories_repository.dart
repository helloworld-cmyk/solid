import '../entities/detail_catagories_content.dart';

abstract class DetailCatagoriesRepository {
  Future<DetailCatagoriesContent> getContent(String categoryTitle);
}
