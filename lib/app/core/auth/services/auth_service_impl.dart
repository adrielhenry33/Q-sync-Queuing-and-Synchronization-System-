import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:q_sync/app/core/auth/interfaces/i_auth_service_.dart';
import 'package:q_sync/app/core/auth/models/user_model.dart';
import 'package:q_sync/app/core/network/api_client.dart';
import 'package:q_sync/app/core/network/result.dart';

class AuthServiceImpl extends IAuthService {
  final ApiClient _client;
  final FlutterSecureStorage _storage;

  static const _tokenKey = 'token';
  static const _userKey = 'user_data';

  AuthServiceImpl(this._client, this._storage);

  @override
  Future<bool> checkAuthStatus() {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<String?> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<Result<UserModel>> login(String email, String password) async {
    try {
      final response = await _client.post<UserModel>(
          '/login', (json) => UserModel.fromJson(json),
          body: {'email': email, 'password': password});

      if (response is Success<UserModel>) {
        _client.token = response.data.token;
        await _storage.write(key: _userKey, value: response.data.token);
        return response;
      }
      return response;
    } catch (e) {
      return Failure(
          errorMessage: 'Erro de conexão, verifique sua rede e tente novamente',
          statusCode: 500);
    }
  }

  @override
  Future<Result<void>> logout() async {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<Result<UserModel>> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
