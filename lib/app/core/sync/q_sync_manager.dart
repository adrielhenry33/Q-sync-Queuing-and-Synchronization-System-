import 'package:drift/drift.dart';
import 'package:q_sync/app/core/database/app_database.dart';
import 'package:q_sync/app/core/database/daos/connection_queue_dao.dart';
import 'package:q_sync/app/core/network/api_client.dart';
import 'package:q_sync/app/core/network/result.dart';

class QSyncManager {
  final ConnectionQueueDao _dao;
  final ApiClient _client;
  QSyncManager(this._dao, this._client);

  Future<int> enQueue(String endpoint, String method, String payload) async {
    try {
      final entry = ConnectionQueueCompanion(
          endpoint: Value(endpoint),
          method: Value(method),
          payload: Value(payload));
      final insertResult = await _dao.insertQueueItem(entry);

      if (insertResult > 0) {
        return 1;
      }
      return 0;
    } on Exception catch (e) {
      return -1;
    }
  }

  Future<void> processQueue() async {
    final queue = await _dao.getAllPendingItems();
    if (queue.isEmpty) return;

    for (var item in queue) {
      switch (item.method.toUpperCase()) {
        case 'POST':
          final result =
              await _client.post(item.endpoint, null, body: item.payload);
          if (result is Success) await _dao.deleteQueueItem(item.id);
          if (result is Failure) break;

          break;
        case 'PUT':
          final result =
              await _client.put(item.endpoint, null, body: item.payload);
          if (result is Success) await _dao.deleteQueueItem(item.id);
          if (result is Failure) break;

          break;

        case 'DELETE':
          final result = await _client.delete(item.endpoint);
          if (result is Success) await _dao.deleteQueueItem(item.id);
          if (result is Failure) break;

          break;
      }
    }
  }
}
