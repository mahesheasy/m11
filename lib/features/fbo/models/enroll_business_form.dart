import 'package:freezed_annotation/freezed_annotation.dart';

part 'enroll_business_form.freezed.dart';
part 'enroll_business_form.g.dart';

@freezed
class EnrollBusinessForm with _$EnrollBusinessForm {
  factory EnrollBusinessForm({
    @JsonKey(name: 'manager_name') String? managerName,
    @JsonKey(name: 'business_name') String? businessName,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'mobile_no') String? mobileNumber,
    @JsonKey(name: 'supplier_type') String? type,
    String? city,
    String? state,
  }) = _EnrollBusinessForm;

  factory EnrollBusinessForm.fromJson(Map<String, dynamic> json) => _$EnrollBusinessFormFromJson(json);
}