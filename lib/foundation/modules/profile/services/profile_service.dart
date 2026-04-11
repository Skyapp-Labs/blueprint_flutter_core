import '../../../core/network/app_service.dart';
import '../../auth/core/models/user.dart';
import '../models/profile_update.dart';

class ProfileService extends AppService {

  ProfileService(super.serviceContext);

  Future<AuthUser> getMe() async {
    final res = await dio.get<Map<String, dynamic>>(endpoints.me);
    return AuthUser.fromJson(res.data!);
  }

  Future<AuthUser> updateMe(ProfileUpdate update) async {
    final body = <String, dynamic>{};
    if (update.firstName != null) body['firstName'] = update.firstName;
    if (update.lastName != null) body['lastName'] = update.lastName;
    if (update.email != null) body['email'] = update.email;

    final res = await dio.patch<Map<String, dynamic>>(
      endpoints.me,
      data: body,
    );
    return AuthUser.fromJson(res.data!);
  }
}
