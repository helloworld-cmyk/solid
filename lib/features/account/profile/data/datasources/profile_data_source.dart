import '../models/profile_model.dart';

abstract class ProfileDataSource {
  Future<ProfileModel> getProfile();
}
