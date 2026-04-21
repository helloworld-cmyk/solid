import '../models/home_feed_model.dart';

abstract class HomeFeedDataSource {
  Future<HomeFeedModel> getHomeFeed();
}
