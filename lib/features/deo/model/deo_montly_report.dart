import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m11_ind/core/model/pair.dart';

part 'deo_montly_report.freezed.dart';
part 'deo_montly_report.g.dart';

typedef DataPair = List<Pair<String, double>>;

@freezed
class DEOMonthlyReport with _$DEOMonthlyReport {
  factory DEOMonthlyReport({
    required String date,
    @JsonKey(name: 'gate_entry') required double gateEntry,
    @JsonKey(name: 'gate_exit') required double gateExit,
    @JsonKey(name: 'uco_deposit') required double ucoDeposit,
    @JsonKey(name: 'can_requests') required double canRequests,
  }) = _DEOMonthlyReport;

  factory DEOMonthlyReport.fromJson(Map<String, dynamic> json) => _$DEOMonthlyReportFromJson(json);
}

extension DEOMonthlyReportExt on List<DEOMonthlyReport> {
  List<Pair<String, double>> get entries => map((e) => Pair(e.date, e.gateEntry)).toList();
  List<Pair<String, double>> get exits => map((e) => Pair(e.date, e.gateExit)).toList();
  List<Pair<String, double>> get ucoDeposits => map((e) => Pair(e.date, e.ucoDeposit)).toList();
  List<Pair<String, double>> get canRequests => map((e) => Pair(e.date, e.canRequests)).toList();
}