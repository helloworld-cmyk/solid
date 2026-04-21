import '../../domain/entities/onboard_page.dart';
import '../../domain/repositories/onboard_pages_repository.dart';
import '../datasources/onboard_pages_data_source.dart';

class OnboardPagesRepositoryImpl implements OnboardPagesRepository {
  const OnboardPagesRepositoryImpl({
    required OnboardPagesDataSource dataSource,
  }) : _dataSource = dataSource;

  final OnboardPagesDataSource _dataSource;

  @override
  List<OnboardPage> getPages() {
    return _dataSource
        .getPages()
        .map((onboardPageModel) => onboardPageModel.toEntity())
        .toList(growable: false);
  }
}
