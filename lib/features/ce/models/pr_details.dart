import 'package:freezed_annotation/freezed_annotation.dart';

part 'pr_details.freezed.dart';
part 'pr_details.g.dart';

@freezed
class PRDetails with _$PRDetails {
  const factory PRDetails({
    @JsonKey(name: 'pr_id') required String id,
    @JsonKey(name: 'pr_print_file_path') required String url,
  }) = _PRDetails;
  factory PRDetails.fromJson(Map<String, dynamic> json) =>
      _$PRDetailsFromJson(json);
}
