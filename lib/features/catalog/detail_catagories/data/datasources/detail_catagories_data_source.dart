import '../models/detail_catagories_content_model.dart';

abstract class DetailCatagoriesDataSource {
  Future<DetailCatagoriesContentModel> getContent(String categoryTitle);
}
