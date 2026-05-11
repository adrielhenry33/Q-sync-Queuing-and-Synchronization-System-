import 'package:q_sync/app/core/auth/models/user_model.dart';
import 'package:q_sync/app/core/network/result.dart';

abstract class IAuthService {
  Future<Result<UserModel>> login(String email, String password);
  Future<Result<UserModel>> resetPassword(String email);
  Future<Result<void>> logout();
  Future<String?> getToken();
  Future<bool> checkAuthStatus();
}
