import 'dart:convert';

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
  Future<Result<UserModel>> checkAuthStatus() async {
    try {
      final token = await _storage.read(key: _tokenKey);
      final userJson = await _storage.read(key: _userKey);

      if (token != null && userJson != null) {
        _client.token = token;
        final user = UserModel.fromJson(jsonDecode(userJson));
        return Success(data: user);
      }
      return Failure(errorMessage: "Sessão expirada ou não encontrada");
    } on Exception catch (e) {
      return Failure(errorMessage: 'Erro ao recuperara a sessão');
    }
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  @override
  Future<Result<UserModel>> login(String email, String password) async {
    try {
      final response = await _client.post<UserModel>(
          '/login', (json) => UserModel.fromJson(json),
          body: {'email': email, 'password': password});

      if (response is Success<UserModel>) {
        _client.token = response.data.token;
        await _storage.write(key: _tokenKey, value: response.data.token);
        await _storage.write(
            key: _userKey, value: jsonEncode(response.data.toJson()));
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
    try {
      _client.token = null;
      await _storage.deleteAll();
      return Success(data: null);
    } catch (e) {
      return Failure(
          errorMessage: 'Erro ao deslogar do sistema', statusCode: 500);
    }
  }

  @override
  Future<Result<UserModel>> updateProfile(UserModel user) async {
    try {
      final response = await _client.put<UserModel>(
        '/users/${user.id}',
        (json) => UserModel.fromJson(json),
        body: user.toJson(),
      );

      if (response is Success<UserModel>) {
        await _storage.write(
            key: _userKey, value: jsonEncode(response.data.toJson()));
        return response;
      }

      return response;
    } catch (e) {
      return Failure(errorMessage: 'Erro ao atualizar perfil', statusCode: 500);
    }
  }
}
