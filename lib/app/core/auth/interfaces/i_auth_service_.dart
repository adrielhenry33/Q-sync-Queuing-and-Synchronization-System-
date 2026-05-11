import 'package:q_sync/app/core/auth/models/user_model.dart';
import 'package:q_sync/app/core/network/result.dart';

abstract class IAuthService {
  Future<Result<UserModel>> login(String email, String password);
  Future<Result<UserModel>> updateProfile(UserModel user);
  Future<Result<void>> logout();
  Future<String?> getToken();
  Future<Result<UserModel>> checkAuthStatus();
}
