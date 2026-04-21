import '../models/profile_model.dart';
import 'profile_data_source.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  const ProfileDataSourceImpl();

  @override
  Future<ProfileModel> getProfile() async {
    return const ProfileModel(
      fullName: 'Savannah Robertson',
      username: '@alexander02',
      avatarPath: 'assets/home/maskgroup2.png',
    );
  }
}
