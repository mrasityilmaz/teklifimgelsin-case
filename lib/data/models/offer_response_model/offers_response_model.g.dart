// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OffersResponseModel _$$_OffersResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_OffersResponseModel(
      activeOffers: (json['active_offers'] as List<dynamic>?)
          ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      amount: json['amount'] as int?,
      carCondition: json['carCondition'],
      clientId: json['client_id'] as String?,
      createdAt: DateTimeParser.parseDateTime(json['created_at'] as String?),
      id: json['id'] as String?,
      maturity: json['maturity'] as int?,
      passiveOffers: (json['passive_offers'] as List<dynamic>?)
          ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sponsoredOffers: (json['sponsored_offers'] as List<dynamic>?)
          ?.map((e) => SponsoredOfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_OffersResponseModelToJson(
        _$_OffersResponseModel instance) =>
    <String, dynamic>{
      'active_offers': instance.activeOffers?.map((e) => e.toJson()).toList(),
      'amount': instance.amount,
      'carCondition': instance.carCondition,
      'client_id': instance.clientId,
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'maturity': instance.maturity,
      'passive_offers': instance.passiveOffers?.map((e) => e.toJson()).toList(),
      'sponsored_offers':
          instance.sponsoredOffers?.map((e) => e.toJson()).toList(),
      'type': instance.type,
    };
