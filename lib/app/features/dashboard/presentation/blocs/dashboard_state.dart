import 'package:q_sync/app/features/dashboard/data/models/dashboard_resumo_model.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashBoardActionLoading extends DashboardState {}

class DashboardSucess extends DashboardState {
  DashboardResumoModel dashboardResumoModel;
  DashboardSucess(this.dashboardResumoModel);
}

class DashboardActionSucess extends DashboardState {
  final String message;
  DashboardActionSucess(this.message);
}

class DashboardError extends DashboardState {
  final String errorMessage;
  DashboardError(this.errorMessage);
}
