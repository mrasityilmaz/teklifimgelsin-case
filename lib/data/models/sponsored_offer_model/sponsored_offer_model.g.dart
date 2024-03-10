// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsored_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SponsoredOfferModel _$$_SponsoredOfferModelFromJson(
        Map<String, dynamic> json) =>
    _$_SponsoredOfferModel(
      adButtonText: json['ad_button_text'] as String?,
      adContent: json['ad_content'] as String?,
      adDetails: json['ad_details'] as String?,
      adDisplayType: json['ad_display_type'] as String?,
      adHeader: json['ad_header'] as String?,
      adImgLink: json['ad_img_link'] as String?,
      adName: json['ad_name'] as String?,
      adUtmLink: json['ad_utm_link'] as String?,
      badgeText: json['badge_text'] as String?,
      bank: json['bank'] as String?,
      bankId: json['bank_id'] as int?,
      endDate: DateTimeParser.parseDateTime(json['end_date'] as String?),
      footnote: json['footnote'] as String?,
      listType: json['list_type'] as int?,
      logoUrl: json['logo_url'] as String?,
      productType: json['product_type'] as int?,
      sponsoredRate: (json['sponsored_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_SponsoredOfferModelToJson(
        _$_SponsoredOfferModel instance) =>
    <String, dynamic>{
      'ad_button_text': instance.adButtonText,
      'ad_content': instance.adContent,
      'ad_details': instance.adDetails,
      'ad_display_type': instance.adDisplayType,
      'ad_header': instance.adHeader,
      'ad_img_link': instance.adImgLink,
      'ad_name': instance.adName,
      'ad_utm_link': instance.adUtmLink,
      'badge_text': instance.badgeText,
      'bank': instance.bank,
      'bank_id': instance.bankId,
      'end_date': instance.endDate?.toIso8601String(),
      'footnote': instance.footnote,
      'list_type': instance.listType,
      'logo_url': instance.logoUrl,
      'product_type': instance.productType,
      'sponsored_rate': instance.sponsoredRate,
    };
