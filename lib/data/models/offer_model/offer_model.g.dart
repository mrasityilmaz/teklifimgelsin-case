// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfferModel _$$_OfferModelFromJson(Map<String, dynamic> json) =>
    _$_OfferModel(
      annualRate: (json['annual_rate'] as num?)?.toDouble(),
      bank: json['bank'] as String?,
      bankId: json['bank_id'] as int?,
      bankType: $enumDecodeNullable(_$BankTypeEnumMap, json['bank_type']) ??
          BankType.OZEL,
      detailNote: json['detail_note'] as String?,
      expertise: (json['expertise'] as num?)?.toDouble(),
      footnote: json['footnote'] as String?,
      hypothecFee: (json['hypothec_fee'] as num?)?.toDouble(),
      interestRate: (json['interest_rate'] as num?)?.toDouble(),
      logoUrl: json['logo_url'] as String?,
      note: json['note'] as String?,
      productName: json['product_name'] as String?,
      sponsoredRate: (json['sponsored_rate'] as num?)?.toDouble(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_OfferModelToJson(_$_OfferModel instance) =>
    <String, dynamic>{
      'annual_rate': instance.annualRate,
      'bank': instance.bank,
      'bank_id': instance.bankId,
      'bank_type': _$BankTypeEnumMap[instance.bankType]!,
      'detail_note': instance.detailNote,
      'expertise': instance.expertise,
      'footnote': instance.footnote,
      'hypothec_fee': instance.hypothecFee,
      'interest_rate': instance.interestRate,
      'logo_url': instance.logoUrl,
      'note': instance.note,
      'product_name': instance.productName,
      'sponsored_rate': instance.sponsoredRate,
      'url': instance.url,
    };

const _$BankTypeEnumMap = {
  BankType.KAMU: 'kamu',
  BankType.KATILIM: 'katilim',
  BankType.OZEL: 'ozel',
};
