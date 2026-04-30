import 'package:q_sync/app/core/network/api_client.dart';
import 'package:q_sync/app/core/network/result.dart';
import 'package:q_sync/app/features/dashboard/data/models/dashboard_resumo_model.dart';

class DashboardRepository {
  final ApiClient _client;

  DashboardRepository(this._client);

  Future<Result<DashboardResumoModel>> getfetchDash({
    String? dataInicio,
    String? dataFim,
    int? filialId,
  }) async {
    final queryParams = <String, dynamic>{
      if (dataInicio != null) 'dataInicio': dataInicio,
      if (dataFim != null) 'dataFim': dataFim,
      if (filialId != null) 'filialId': filialId,
    };
    return await _client.get(
      '/dashboard/resumo',
      fromJson: (p0) => DashboardResumoModel.fromJson(p0),
      queryParameters: queryParams,
    );
  }

  Future<Result<DashboardResumoModel>> postOnDash(
    DashboardResumoModel dashboard,
  ) async {
    return await _client.post(
      '/dashboard/port',
      (p0) => DashboardResumoModel.fromJson(p0),
      body: dashboard.toJson(),
    );
  }

  Future<Result<DashboardResumoModel>> putOnDash(
    DashboardResumoModel dashboard,
  ) async {
    return await _client.put(
      '/dashboard/port',
      (p0) => DashboardResumoModel.fromJson(p0),
      body: dashboard.toJson(),
    );
  }

  Future<Result<void>> deleteDashData(int id) async {
    return await _client.delete('/dashboard/port/$id');
  }
}
