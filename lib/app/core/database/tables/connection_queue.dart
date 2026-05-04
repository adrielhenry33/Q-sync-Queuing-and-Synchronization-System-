import 'package:drift/drift.dart';

class ConnectionQueue extends Table {
  //ID auto incrementável
  IntColumn get id => integer().autoIncrement()();

  TextColumn get endpoint => text()();

  TextColumn get method => text()();

  TextColumn get body => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
