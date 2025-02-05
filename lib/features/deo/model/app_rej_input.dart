import 'package:equatable/equatable.dart';

class ApproveCanRequest extends Equatable {
  const ApproveCanRequest({
    required this.canReqId,
    required this.approvedCans,
    required this.date,
  });

  final String canReqId;
  final int approvedCans;
  final String date;

  Map<String, dynamic> toJson() => {
        'can_request_id': canReqId,
        'approve': 1,
        'approved_cans': approvedCans,
        'deo_delivery_date': date,
      };

  @override
  List<Object?> get props => [canReqId, approvedCans];
}

class RejectCanReqInput extends Equatable {
  const RejectCanReqInput({
    required this.canReqId,
    required this.reason,
  });

  final String canReqId;
  final String reason;

  Map<String, dynamic> toJson() =>
      {'can_request_id': canReqId, 'approve': 0, 'reject_reason': reason};

  @override
  List<Object?> get props => [
        canReqId,
        reason,
      ];
}
