import 'package:http/http.dart' as http;
import 'package:q_sync/app/core/interfaces/i_network_client.dart';
import 'package:q_sync/app/core/network/result.dart';

class ApiClient implements INetworkClient {
  ApiClient(this._client);

  final http.Client _client;
  final String _baseUrl = 'http://172.16.10.110:8080';
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer token-ficticio-123456',
  };

  String get baseUrl => _baseUrl;

  @override
  Future<Result<void>> delete(String path) async {
    try {
      final uri = Uri.parse(path);
      final response = await _client.delete(uri, headers: _headers);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success<void>(data: null, statusCode: response.statusCode);
      }

      return Failure<void>(
        errorMessage: 'Erro ao deletar',
        statusCode: response.statusCode,
      );
    } catch (e, st) {
      return Failure<void>(errorMessage: 'Falha na comunicação $e', stackTrace: st);
    }
  }

  @override
  Future<Result<T>> get<T>(
    String? path, {
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Result<T>> post<T>(String path, {Object? body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Result<T>> put<T>(String path, {Object? body}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
