import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_coding_setup/data/enums/credit_type_enum.dart';

part 'search_params_model.freezed.dart';
part 'search_params_model.g.dart';

@freezed
class SearchParamsModel with _$SearchParamsModel {
  const factory SearchParamsModel({
    required double amount,
    required int expiry,
    required LoanTypeEnum loanType,
    required String id,
    DateTime? savedTime,
  }) = _SearchParamsModel;

  factory SearchParamsModel.fromJson(Map<String, dynamic> json) => _$SearchParamsModelFromJson(json);
}
