// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  return _OfferModel.fromJson(json);
}

/// @nodoc
mixin _$OfferModel {
  @JsonKey(name: 'annual_rate')
  double? get annualRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank')
  String? get bank => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_id')
  int? get bankId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_type')
  BankType get bankType => throw _privateConstructorUsedError;
  @JsonKey(name: 'detail_note')
  String? get detailNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'expertise')
  double? get expertise => throw _privateConstructorUsedError;
  @JsonKey(name: 'footnote')
  String? get footnote => throw _privateConstructorUsedError;
  @JsonKey(name: 'hypothec_fee')
  double? get hypothecFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'interest_rate')
  double? get interestRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sponsored_rate')
  double? get sponsoredRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferModelCopyWith<OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferModelCopyWith<$Res> {
  factory $OfferModelCopyWith(
          OfferModel value, $Res Function(OfferModel) then) =
      _$OfferModelCopyWithImpl<$Res, OfferModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'annual_rate') double? annualRate,
      @JsonKey(name: 'bank') String? bank,
      @JsonKey(name: 'bank_id') int? bankId,
      @JsonKey(name: 'bank_type') BankType bankType,
      @JsonKey(name: 'detail_note') String? detailNote,
      @JsonKey(name: 'expertise') double? expertise,
      @JsonKey(name: 'footnote') String? footnote,
      @JsonKey(name: 'hypothec_fee') double? hypothecFee,
      @JsonKey(name: 'interest_rate') double? interestRate,
      @JsonKey(name: 'logo_url') String? logoUrl,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'sponsored_rate') double? sponsoredRate,
      @JsonKey(name: 'url') String? url});
}

/// @nodoc
class _$OfferModelCopyWithImpl<$Res, $Val extends OfferModel>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annualRate = freezed,
    Object? bank = freezed,
    Object? bankId = freezed,
    Object? bankType = null,
    Object? detailNote = freezed,
    Object? expertise = freezed,
    Object? footnote = freezed,
    Object? hypothecFee = freezed,
    Object? interestRate = freezed,
    Object? logoUrl = freezed,
    Object? note = freezed,
    Object? productName = freezed,
    Object? sponsoredRate = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      annualRate: freezed == annualRate
          ? _value.annualRate
          : annualRate // ignore: cast_nullable_to_non_nullable
              as double?,
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankType: null == bankType
          ? _value.bankType
          : bankType // ignore: cast_nullable_to_non_nullable
              as BankType,
      detailNote: freezed == detailNote
          ? _value.detailNote
          : detailNote // ignore: cast_nullable_to_non_nullable
              as String?,
      expertise: freezed == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as double?,
      footnote: freezed == footnote
          ? _value.footnote
          : footnote // ignore: cast_nullable_to_non_nullable
              as String?,
      hypothecFee: freezed == hypothecFee
          ? _value.hypothecFee
          : hypothecFee // ignore: cast_nullable_to_non_nullable
              as double?,
      interestRate: freezed == interestRate
          ? _value.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      sponsoredRate: freezed == sponsoredRate
          ? _value.sponsoredRate
          : sponsoredRate // ignore: cast_nullable_to_non_nullable
              as double?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OfferModelCopyWith<$Res>
    implements $OfferModelCopyWith<$Res> {
  factory _$$_OfferModelCopyWith(
          _$_OfferModel value, $Res Function(_$_OfferModel) then) =
      __$$_OfferModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'annual_rate') double? annualRate,
      @JsonKey(name: 'bank') String? bank,
      @JsonKey(name: 'bank_id') int? bankId,
      @JsonKey(name: 'bank_type') BankType bankType,
      @JsonKey(name: 'detail_note') String? detailNote,
      @JsonKey(name: 'expertise') double? expertise,
      @JsonKey(name: 'footnote') String? footnote,
      @JsonKey(name: 'hypothec_fee') double? hypothecFee,
      @JsonKey(name: 'interest_rate') double? interestRate,
      @JsonKey(name: 'logo_url') String? logoUrl,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'sponsored_rate') double? sponsoredRate,
      @JsonKey(name: 'url') String? url});
}

/// @nodoc
class __$$_OfferModelCopyWithImpl<$Res>
    extends _$OfferModelCopyWithImpl<$Res, _$_OfferModel>
    implements _$$_OfferModelCopyWith<$Res> {
  __$$_OfferModelCopyWithImpl(
      _$_OfferModel _value, $Res Function(_$_OfferModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annualRate = freezed,
    Object? bank = freezed,
    Object? bankId = freezed,
    Object? bankType = null,
    Object? detailNote = freezed,
    Object? expertise = freezed,
    Object? footnote = freezed,
    Object? hypothecFee = freezed,
    Object? interestRate = freezed,
    Object? logoUrl = freezed,
    Object? note = freezed,
    Object? productName = freezed,
    Object? sponsoredRate = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_OfferModel(
      annualRate: freezed == annualRate
          ? _value.annualRate
          : annualRate // ignore: cast_nullable_to_non_nullable
              as double?,
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankType: null == bankType
          ? _value.bankType
          : bankType // ignore: cast_nullable_to_non_nullable
              as BankType,
      detailNote: freezed == detailNote
          ? _value.detailNote
          : detailNote // ignore: cast_nullable_to_non_nullable
              as String?,
      expertise: freezed == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as double?,
      footnote: freezed == footnote
          ? _value.footnote
          : footnote // ignore: cast_nullable_to_non_nullable
              as String?,
      hypothecFee: freezed == hypothecFee
          ? _value.hypothecFee
          : hypothecFee // ignore: cast_nullable_to_non_nullable
              as double?,
      interestRate: freezed == interestRate
          ? _value.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      sponsoredRate: freezed == sponsoredRate
          ? _value.sponsoredRate
          : sponsoredRate // ignore: cast_nullable_to_non_nullable
              as double?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OfferModel implements _OfferModel {
  const _$_OfferModel(
      {@JsonKey(name: 'annual_rate') this.annualRate,
      @JsonKey(name: 'bank') this.bank,
      @JsonKey(name: 'bank_id') this.bankId,
      @JsonKey(name: 'bank_type') this.bankType = BankType.OZEL,
      @JsonKey(name: 'detail_note') this.detailNote,
      @JsonKey(name: 'expertise') this.expertise,
      @JsonKey(name: 'footnote') this.footnote,
      @JsonKey(name: 'hypothec_fee') this.hypothecFee,
      @JsonKey(name: 'interest_rate') this.interestRate,
      @JsonKey(name: 'logo_url') this.logoUrl,
      @JsonKey(name: 'note') this.note,
      @JsonKey(name: 'product_name') this.productName,
      @JsonKey(name: 'sponsored_rate') this.sponsoredRate,
      @JsonKey(name: 'url') this.url});

  factory _$_OfferModel.fromJson(Map<String, dynamic> json) =>
      _$$_OfferModelFromJson(json);

  @override
  @JsonKey(name: 'annual_rate')
  final double? annualRate;
  @override
  @JsonKey(name: 'bank')
  final String? bank;
  @override
  @JsonKey(name: 'bank_id')
  final int? bankId;
  @override
  @JsonKey(name: 'bank_type')
  final BankType bankType;
  @override
  @JsonKey(name: 'detail_note')
  final String? detailNote;
  @override
  @JsonKey(name: 'expertise')
  final double? expertise;
  @override
  @JsonKey(name: 'footnote')
  final String? footnote;
  @override
  @JsonKey(name: 'hypothec_fee')
  final double? hypothecFee;
  @override
  @JsonKey(name: 'interest_rate')
  final double? interestRate;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @override
  @JsonKey(name: 'note')
  final String? note;
  @override
  @JsonKey(name: 'product_name')
  final String? productName;
  @override
  @JsonKey(name: 'sponsored_rate')
  final double? sponsoredRate;
  @override
  @JsonKey(name: 'url')
  final String? url;

  @override
  String toString() {
    return 'OfferModel(annualRate: $annualRate, bank: $bank, bankId: $bankId, bankType: $bankType, detailNote: $detailNote, expertise: $expertise, footnote: $footnote, hypothecFee: $hypothecFee, interestRate: $interestRate, logoUrl: $logoUrl, note: $note, productName: $productName, sponsoredRate: $sponsoredRate, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfferModel &&
            (identical(other.annualRate, annualRate) ||
                other.annualRate == annualRate) &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.bankType, bankType) ||
                other.bankType == bankType) &&
            (identical(other.detailNote, detailNote) ||
                other.detailNote == detailNote) &&
            (identical(other.expertise, expertise) ||
                other.expertise == expertise) &&
            (identical(other.footnote, footnote) ||
                other.footnote == footnote) &&
            (identical(other.hypothecFee, hypothecFee) ||
                other.hypothecFee == hypothecFee) &&
            (identical(other.interestRate, interestRate) ||
                other.interestRate == interestRate) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sponsoredRate, sponsoredRate) ||
                other.sponsoredRate == sponsoredRate) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      annualRate,
      bank,
      bankId,
      bankType,
      detailNote,
      expertise,
      footnote,
      hypothecFee,
      interestRate,
      logoUrl,
      note,
      productName,
      sponsoredRate,
      url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfferModelCopyWith<_$_OfferModel> get copyWith =>
      __$$_OfferModelCopyWithImpl<_$_OfferModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfferModelToJson(
      this,
    );
  }
}

abstract class _OfferModel implements OfferModel {
  const factory _OfferModel(
      {@JsonKey(name: 'annual_rate') final double? annualRate,
      @JsonKey(name: 'bank') final String? bank,
      @JsonKey(name: 'bank_id') final int? bankId,
      @JsonKey(name: 'bank_type') final BankType bankType,
      @JsonKey(name: 'detail_note') final String? detailNote,
      @JsonKey(name: 'expertise') final double? expertise,
      @JsonKey(name: 'footnote') final String? footnote,
      @JsonKey(name: 'hypothec_fee') final double? hypothecFee,
      @JsonKey(name: 'interest_rate') final double? interestRate,
      @JsonKey(name: 'logo_url') final String? logoUrl,
      @JsonKey(name: 'note') final String? note,
      @JsonKey(name: 'product_name') final String? productName,
      @JsonKey(name: 'sponsored_rate') final double? sponsoredRate,
      @JsonKey(name: 'url') final String? url}) = _$_OfferModel;

  factory _OfferModel.fromJson(Map<String, dynamic> json) =
      _$_OfferModel.fromJson;

  @override
  @JsonKey(name: 'annual_rate')
  double? get annualRate;
  @override
  @JsonKey(name: 'bank')
  String? get bank;
  @override
  @JsonKey(name: 'bank_id')
  int? get bankId;
  @override
  @JsonKey(name: 'bank_type')
  BankType get bankType;
  @override
  @JsonKey(name: 'detail_note')
  String? get detailNote;
  @override
  @JsonKey(name: 'expertise')
  double? get expertise;
  @override
  @JsonKey(name: 'footnote')
  String? get footnote;
  @override
  @JsonKey(name: 'hypothec_fee')
  double? get hypothecFee;
  @override
  @JsonKey(name: 'interest_rate')
  double? get interestRate;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  @JsonKey(name: 'note')
  String? get note;
  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @override
  @JsonKey(name: 'sponsored_rate')
  double? get sponsoredRate;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_OfferModelCopyWith<_$_OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}
