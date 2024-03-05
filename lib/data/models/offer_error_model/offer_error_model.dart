// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_error_model.freezed.dart';
part 'offer_error_model.g.dart';

@freezed
class OfferErrorModel with _$OfferErrorModel {
  const factory OfferErrorModel({
    @JsonKey(name: 'error_message') String? errorMessage,
    @JsonKey(name: 'error_type') String? errorType,
  }) = _OfferErrorModel;

  factory OfferErrorModel.fromJson(Map<String, dynamic> json) => _$OfferErrorModelFromJson(json);
}
