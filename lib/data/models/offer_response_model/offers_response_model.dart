// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_coding_setup/core/parsers/datetime_parser.dart';
import 'package:my_coding_setup/data/models/offer_model/offer_model.dart';
import 'package:my_coding_setup/data/models/sponsored_offer_model/sponsored_offer_model.dart';

part 'offers_response_model.freezed.dart';
part 'offers_response_model.g.dart';

@freezed
class OffersResponseModel with _$OffersResponseModel {
  const factory OffersResponseModel({
    @JsonKey(name: 'active_offers') List<OfferModel>? activeOffers,
    @JsonKey(name: 'amount') int? amount,
    @JsonKey(name: 'carCondition') dynamic carCondition,
    @JsonKey(name: 'client_id') String? clientId,
    @JsonKey(name: 'created_at', fromJson: DateTimeParser.parseDateTime) DateTime? createdAt,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'maturity') int? maturity,
    @JsonKey(name: 'passive_offers') List<OfferModel>? passiveOffers,
    @JsonKey(name: 'sponsored_offers') List<SponsoredOfferModel>? sponsoredOffers,
    @JsonKey(name: 'type') String? type,
  }) = _OffersResponseModel;

  factory OffersResponseModel.fromJson(Map<String, dynamic> json) => _$OffersResponseModelFromJson(json);
}
