import 'package:bloc/bloc.dart';
import 'package:q_sync/app/core/network/result.dart';
import 'package:q_sync/app/features/dashboard/data/repository/dashboard_repository.dart';
import 'package:q_sync/app/features/dashboard/presentation/blocs/dashboard_event.dart';
import 'package:q_sync/app/features/dashboard/presentation/blocs/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _repository;

  DashboardBloc(this._repository) : super(DashboardInitial()) {
    on<LoadDashboardData>((event, emit) async {
      emit(DashboardLoading());
      final result = await _repository.getfetchDash();

      switch (result) {
        case Success():
          emit(DashboardSucess(result.data));
          break;
        case Failure():
          emit(DashboardError(result.errorMessage ?? 'Erro desconhecido'));
      }
    });

    on<DeleteByIdDashboard>((event, emit) async {
      emit(DashBoardActionLoading());
      final result = await _repository.deleteDashData(event.id);

      switch (result) {
        case Success():
          emit(DashboardActionSucess('Dados deletados com Sucesso'));
          add(LoadDashboardData());
          break;
        case Failure():
          emit(DashboardError('Erro ao deletar os dados'));
      }
    });

    on<PutOnDashboard>((event, emit) async {
      emit(DashBoardActionLoading());

      final result = await _repository.putOnDash(event.dashboardResumoModel);

      switch (result) {
        case Success():
          emit(DashboardActionSucess('Dados  atualizados com sucesso'));
          add(LoadDashboardData());

          break;
        case Failure():
          emit(DashboardError('Erro ao enviar os dados, tente novamente'));
      }
    });

    on<PostOnDashboard>((event, emit) async {
      emit(DashBoardActionLoading());

      final result = await _repository.postOnDash(event.dashboardResumoModel);

      switch (result) {
        case Success():
          emit(DashboardActionSucess('Dados criados com sucesso'));
          add(LoadDashboardData());
          break;
        case Failure():
          emit(DashboardError('Erro ao enviar os dados, tente novamente'));
      }
    });
  }
}
