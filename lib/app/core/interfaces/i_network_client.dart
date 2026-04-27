import 'package:q_sync/app/core/network/result.dart';

abstract class INetworkClient {
  Future<Result<T>> get<T>(
    String? path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic) fromJson,
  });

  Future<Result<T>> post<T>(String path, {Object? body});

  Future<Result<T>> put<T>(String path, {Object? body});

  Future<Result<void>> delete(String path);
}
