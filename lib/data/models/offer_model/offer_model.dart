// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teklifimgelsin_case/data/enums/bank_type_enum.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel {
  const factory OfferModel({
    @JsonKey(name: 'annual_rate') double? annualRate,
    @JsonKey(name: 'bank') String? bank,
    @JsonKey(name: 'bank_id') int? bankId,
    @Default(BankType.OZEL) @JsonKey(name: 'bank_type') BankType bankType,
    @JsonKey(name: 'detail_note') String? detailNote,
    @JsonKey(name: 'expertise') double? expertise,
    @JsonKey(name: 'footnote') String? footnote,
    @JsonKey(name: 'hypothec_fee') double? hypothecFee,
    @JsonKey(name: 'interest_rate') double? interestRate,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'product_name') String? productName,
    @JsonKey(name: 'sponsored_rate') double? sponsoredRate,
    @JsonKey(name: 'url') String? url,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);
}




// { ACTIVE OFFER MODEL
//             "annual_rate": 63.41502975035132,
//             "bank": "TEB",
//             "bank_id": 400100032,
//             "bank_type": "ozel",
//             "detail_note": null,
//             "expertise": 0.0,
//             "footnote": null,
//             "hypothec_fee": 0.0,
//             "interest_rate": 3.19,
//             "logo_url": null,
//             "note": null,
//             "product_name": "İhtiyaç Kredisi",
//             "sponsored_rate": 0.0,
//             "url": "https://app.tr.adjust.com/j5jx6tf?campaign=affiliate&adgroup=teb-ihtiyac-kredisi&creative=listeleme"
//         },



// { PASSIVE OFFER MODEL
//             "annual_rate": 65.87099792483036,
//             "bank": "ICBC",
//             "bank_id": 400100109,
//             "bank_type": "ozel",
//             "detail_note": null,
//             "expertise": 0.0,
//             "footnote": null,
//             "hypothec_fee": 0.0,
//             "interest_rate": 3.29,
//             "logo_url": null,
//             "note": null,
//             "product_name": "İhtiyaç Kredisi",
//             "sponsored_rate": 0.0,
//             "url": ""
//         },