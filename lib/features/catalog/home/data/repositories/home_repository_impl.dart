import '../../domain/entities/home_feed.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_feed_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required HomeFeedDataSource dataSource})
    : _dataSource = dataSource;

  final HomeFeedDataSource _dataSource;

  @override
  Future<HomeFeed> getHomeFeed() async {
    final homeFeedModel = await _dataSource.getHomeFeed();
    return homeFeedModel.toEntity();
  }
}
