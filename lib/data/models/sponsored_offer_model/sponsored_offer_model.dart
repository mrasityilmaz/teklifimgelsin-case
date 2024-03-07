// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_coding_setup/core/parsers__and_formatters/datetime_parser.dart';

part 'sponsored_offer_model.freezed.dart';
part 'sponsored_offer_model.g.dart';

@freezed
class SponsoredOfferModel with _$SponsoredOfferModel {
  const factory SponsoredOfferModel({
    @JsonKey(name: 'ad_button_text') String? adButtonText,
    @JsonKey(name: 'ad_content') String? adContent,
    @JsonKey(name: 'ad_details') String? adDetails,
    @JsonKey(name: 'ad_display_type') String? adDisplayType,
    @JsonKey(name: 'ad_header') String? adHeader,
    @JsonKey(name: 'ad_img_link') String? adImgLink,
    @JsonKey(name: 'ad_name') String? adName,
    @JsonKey(name: 'ad_utm_link') String? adUtmLink,
    @JsonKey(name: 'badge_text') String? badgeText,
    @JsonKey(name: 'bank') String? bank,
    @JsonKey(name: 'bank_id') int? bankId,
    @JsonKey(name: 'end_date', fromJson: DateTimeParser.parseDateTime) DateTime? endDate,
    @JsonKey(name: 'footnote') String? footnote,
    @JsonKey(name: 'list_type') int? listType,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'product_type') int? productType,
    @JsonKey(name: 'sponsored_rate') int? sponsoredRate,
  }) = _SponsoredOfferModel;

  factory SponsoredOfferModel.fromJson(Map<String, dynamic> json) => _$SponsoredOfferModelFromJson(json);
}
