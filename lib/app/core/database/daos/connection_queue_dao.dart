import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/connection_queue.dart';

part 'connection_queue_dao.g.dart';

@DriftAccessor(tables: [ConnectionQueue])
class ConnectionQueueDao extends DatabaseAccessor<AppDatabase>
    with _$ConnectionQueueDaoMixin {
  ConnectionQueueDao(super.db);

  //Inserção com companions
  Future<int> insertQueueItem(ConnectionQueueCompanion entry) {
    return into(connectionQueue).insert(entry);
  }

  //Filtra os itens pendentes do mais recente ate o mais atual respeitando ordem cronologica
  Future<List<ConnectionQueueData>> getAllPendingItems() {
    return (select(connectionQueue)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .get();
  }

  //Deleção segura por id
  Future<int> deleteQueueItem(int id) {
    return (delete(connectionQueue)..where((t) => t.id.equals(id))).go();
  }
}
