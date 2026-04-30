import 'package:q_sync/app/features/dashboard/data/models/dashboard_resumo_model.dart';

abstract class DashboardEvent {}

class LoadDashboardData extends DashboardEvent {}

class DeleteByIdDashboard extends DashboardEvent {
  final int id;
  DeleteByIdDashboard(this.id);
}

class PostOnDashboard extends DashboardEvent {
  DashboardResumoModel dashboardResumoModel;
  PostOnDashboard(this.dashboardResumoModel);
}

class PutOnDashboard extends DashboardEvent {
  DashboardResumoModel dashboardResumoModel;
  PutOnDashboard(this.dashboardResumoModel);
}
