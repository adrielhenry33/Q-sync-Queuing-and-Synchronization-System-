// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ConnectionQueueTable extends ConnectionQueue
    with TableInfo<$ConnectionQueueTable, ConnectionQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConnectionQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _endpointMeta =
      const VerificationMeta('endpoint');
  @override
  late final GeneratedColumn<String> endpoint = GeneratedColumn<String>(
      'endpoint', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
      'method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, endpoint, method, payload, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'connection_queue';
  @override
  VerificationContext validateIntegrity(
      Insertable<ConnectionQueueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('endpoint')) {
      context.handle(_endpointMeta,
          endpoint.isAcceptableOrUnknown(data['endpoint']!, _endpointMeta));
    } else if (isInserting) {
      context.missing(_endpointMeta);
    }
    if (data.containsKey('method')) {
      context.handle(_methodMeta,
          method.isAcceptableOrUnknown(data['method']!, _methodMeta));
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConnectionQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConnectionQueueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      endpoint: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}endpoint'])!,
      method: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ConnectionQueueTable createAlias(String alias) {
    return $ConnectionQueueTable(attachedDatabase, alias);
  }
}

class ConnectionQueueData extends DataClass
    implements Insertable<ConnectionQueueData> {
  final int id;
  final String endpoint;
  final String method;
  final String payload;
  final DateTime createdAt;
  const ConnectionQueueData(
      {required this.id,
      required this.endpoint,
      required this.method,
      required this.payload,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['endpoint'] = Variable<String>(endpoint);
    map['method'] = Variable<String>(method);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ConnectionQueueCompanion toCompanion(bool nullToAbsent) {
    return ConnectionQueueCompanion(
      id: Value(id),
      endpoint: Value(endpoint),
      method: Value(method),
      payload: Value(payload),
      createdAt: Value(createdAt),
    );
  }

  factory ConnectionQueueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConnectionQueueData(
      id: serializer.fromJson<int>(json['id']),
      endpoint: serializer.fromJson<String>(json['endpoint']),
      method: serializer.fromJson<String>(json['method']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'endpoint': serializer.toJson<String>(endpoint),
      'method': serializer.toJson<String>(method),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ConnectionQueueData copyWith(
          {int? id,
          String? endpoint,
          String? method,
          String? payload,
          DateTime? createdAt}) =>
      ConnectionQueueData(
        id: id ?? this.id,
        endpoint: endpoint ?? this.endpoint,
        method: method ?? this.method,
        payload: payload ?? this.payload,
        createdAt: createdAt ?? this.createdAt,
      );
  ConnectionQueueData copyWithCompanion(ConnectionQueueCompanion data) {
    return ConnectionQueueData(
      id: data.id.present ? data.id.value : this.id,
      endpoint: data.endpoint.present ? data.endpoint.value : this.endpoint,
      method: data.method.present ? data.method.value : this.method,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionQueueData(')
          ..write('id: $id, ')
          ..write('endpoint: $endpoint, ')
          ..write('method: $method, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, endpoint, method, payload, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConnectionQueueData &&
          other.id == this.id &&
          other.endpoint == this.endpoint &&
          other.method == this.method &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt);
}

class ConnectionQueueCompanion extends UpdateCompanion<ConnectionQueueData> {
  final Value<int> id;
  final Value<String> endpoint;
  final Value<String> method;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  const ConnectionQueueCompanion({
    this.id = const Value.absent(),
    this.endpoint = const Value.absent(),
    this.method = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ConnectionQueueCompanion.insert({
    this.id = const Value.absent(),
    required String endpoint,
    required String method,
    required String payload,
    this.createdAt = const Value.absent(),
  })  : endpoint = Value(endpoint),
        method = Value(method),
        payload = Value(payload);
  static Insertable<ConnectionQueueData> custom({
    Expression<int>? id,
    Expression<String>? endpoint,
    Expression<String>? method,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (endpoint != null) 'endpoint': endpoint,
      if (method != null) 'method': method,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ConnectionQueueCompanion copyWith(
      {Value<int>? id,
      Value<String>? endpoint,
      Value<String>? method,
      Value<String>? payload,
      Value<DateTime>? createdAt}) {
    return ConnectionQueueCompanion(
      id: id ?? this.id,
      endpoint: endpoint ?? this.endpoint,
      method: method ?? this.method,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (endpoint.present) {
      map['endpoint'] = Variable<String>(endpoint.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionQueueCompanion(')
          ..write('id: $id, ')
          ..write('endpoint: $endpoint, ')
          ..write('method: $method, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ConnectionQueueTable connectionQueue =
      $ConnectionQueueTable(this);
  late final ConnectionQueueDao connectionQueueDao =
      ConnectionQueueDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [connectionQueue];
}

typedef $$ConnectionQueueTableCreateCompanionBuilder = ConnectionQueueCompanion
    Function({
  Value<int> id,
  required String endpoint,
  required String method,
  required String payload,
  Value<DateTime> createdAt,
});
typedef $$ConnectionQueueTableUpdateCompanionBuilder = ConnectionQueueCompanion
    Function({
  Value<int> id,
  Value<String> endpoint,
  Value<String> method,
  Value<String> payload,
  Value<DateTime> createdAt,
});

class $$ConnectionQueueTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ConnectionQueueTable> {
  $$ConnectionQueueTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get endpoint => $state.composableBuilder(
      column: $state.table.endpoint,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get method => $state.composableBuilder(
      column: $state.table.method,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get payload => $state.composableBuilder(
      column: $state.table.payload,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ConnectionQueueTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ConnectionQueueTable> {
  $$ConnectionQueueTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get endpoint => $state.composableBuilder(
      column: $state.table.endpoint,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get method => $state.composableBuilder(
      column: $state.table.method,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get payload => $state.composableBuilder(
      column: $state.table.payload,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ConnectionQueueTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConnectionQueueTable,
    ConnectionQueueData,
    $$ConnectionQueueTableFilterComposer,
    $$ConnectionQueueTableOrderingComposer,
    $$ConnectionQueueTableCreateCompanionBuilder,
    $$ConnectionQueueTableUpdateCompanionBuilder,
    (
      ConnectionQueueData,
      BaseReferences<_$AppDatabase, $ConnectionQueueTable, ConnectionQueueData>
    ),
    ConnectionQueueData,
    PrefetchHooks Function()> {
  $$ConnectionQueueTableTableManager(
      _$AppDatabase db, $ConnectionQueueTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ConnectionQueueTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ConnectionQueueTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> endpoint = const Value.absent(),
            Value<String> method = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ConnectionQueueCompanion(
            id: id,
            endpoint: endpoint,
            method: method,
            payload: payload,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String endpoint,
            required String method,
            required String payload,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ConnectionQueueCompanion.insert(
            id: id,
            endpoint: endpoint,
            method: method,
            payload: payload,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ConnectionQueueTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ConnectionQueueTable,
    ConnectionQueueData,
    $$ConnectionQueueTableFilterComposer,
    $$ConnectionQueueTableOrderingComposer,
    $$ConnectionQueueTableCreateCompanionBuilder,
    $$ConnectionQueueTableUpdateCompanionBuilder,
    (
      ConnectionQueueData,
      BaseReferences<_$AppDatabase, $ConnectionQueueTable, ConnectionQueueData>
    ),
    ConnectionQueueData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ConnectionQueueTableTableManager get connectionQueue =>
      $$ConnectionQueueTableTableManager(_db, _db.connectionQueue);
}
