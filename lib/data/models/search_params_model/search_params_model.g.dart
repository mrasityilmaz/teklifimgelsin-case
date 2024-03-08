// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchParamsModel _$$_SearchParamsModelFromJson(Map<String, dynamic> json) =>
    _$_SearchParamsModel(
      amount: (json['amount'] as num).toDouble(),
      expiry: json['expiry'] as int,
      loanType: $enumDecode(_$LoanTypeEnumEnumMap, json['loanType']),
      id: json['id'] as String,
      savedTime: json['savedTime'] == null
          ? null
          : DateTime.parse(json['savedTime'] as String),
    );

Map<String, dynamic> _$$_SearchParamsModelToJson(
        _$_SearchParamsModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'expiry': instance.expiry,
      'loanType': _$LoanTypeEnumEnumMap[instance.loanType]!,
      'id': instance.id,
      'savedTime': instance.savedTime?.toIso8601String(),
    };

const _$LoanTypeEnumEnumMap = {
  LoanTypeEnum.personalFinanceLoan: 'personalFinanceLoan',
  LoanTypeEnum.houseLoan: 'houseLoan',
  LoanTypeEnum.vehicleLoan: 'vehicleLoan',
};
