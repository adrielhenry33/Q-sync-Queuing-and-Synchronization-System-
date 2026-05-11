import 'package:q_sync/app/core/network/api_client.dart';
import 'package:q_sync/app/core/network/result.dart';

abstract class IAuthService {
  Future<Result<void>> login(String email, String password);
  Future<Result<void>> resetPassword(String email);
  Future<Result<void>> logout();
  Future<String?> getToken();
  Future<bool>checkAuthStatus();
}
