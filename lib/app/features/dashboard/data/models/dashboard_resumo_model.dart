class DashboardResumoModel {
  final double faturamentoTotal;
  final int metasAtingidas;
  final int alertasAtivos;

  DashboardResumoModel({
    required this.faturamentoTotal,
    required this.metasAtingidas,
    required this.alertasAtivos,
  });

  factory DashboardResumoModel.fromJson(Map<String, dynamic> json) {
    return DashboardResumoModel(
      faturamentoTotal: (json['faturamentoTotal'] ?? 0).toDouble(),
      metasAtingidas: json['metasAtingidas'] ?? 0,
      alertasAtivos: json['alertasAtivos'] ?? 0,
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'faturamentoTotal': faturamentoTotal,
      'metasAtingidas': metasAtingidas,
      'alertasAtivos': alertasAtivos
    };
  }
}
