// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OffersResponseModel _$OffersResponseModelFromJson(Map<String, dynamic> json) {
  return _OffersResponseModel.fromJson(json);
}

/// @nodoc
mixin _$OffersResponseModel {
  @JsonKey(name: 'active_offers')
  List<OfferModel>? get activeOffers => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'carCondition')
  dynamic get carCondition => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_id')
  String? get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: DateTimeParser.parseDateTime)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'maturity')
  int? get maturity => throw _privateConstructorUsedError;
  @JsonKey(name: 'passive_offers')
  List<OfferModel>? get passiveOffers => throw _privateConstructorUsedError;
  @JsonKey(name: 'sponsored_offers')
  List<SponsoredOfferModel>? get sponsoredOffers =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OffersResponseModelCopyWith<OffersResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersResponseModelCopyWith<$Res> {
  factory $OffersResponseModelCopyWith(
          OffersResponseModel value, $Res Function(OffersResponseModel) then) =
      _$OffersResponseModelCopyWithImpl<$Res, OffersResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'active_offers') List<OfferModel>? activeOffers,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'carCondition') dynamic carCondition,
      @JsonKey(name: 'client_id') String? clientId,
      @JsonKey(name: 'created_at', fromJson: DateTimeParser.parseDateTime)
      DateTime? createdAt,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'maturity') int? maturity,
      @JsonKey(name: 'passive_offers') List<OfferModel>? passiveOffers,
      @JsonKey(name: 'sponsored_offers')
      List<SponsoredOfferModel>? sponsoredOffers,
      @JsonKey(name: 'type') String? type});
}

/// @nodoc
class _$OffersResponseModelCopyWithImpl<$Res, $Val extends OffersResponseModel>
    implements $OffersResponseModelCopyWith<$Res> {
  _$OffersResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeOffers = freezed,
    Object? amount = freezed,
    Object? carCondition = freezed,
    Object? clientId = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? maturity = freezed,
    Object? passiveOffers = freezed,
    Object? sponsoredOffers = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      activeOffers: freezed == activeOffers
          ? _value.activeOffers
          : activeOffers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      carCondition: freezed == carCondition
          ? _value.carCondition
          : carCondition // ignore: cast_nullable_to_non_nullable
              as dynamic,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      maturity: freezed == maturity
          ? _value.maturity
          : maturity // ignore: cast_nullable_to_non_nullable
              as int?,
      passiveOffers: freezed == passiveOffers
          ? _value.passiveOffers
          : passiveOffers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>?,
      sponsoredOffers: freezed == sponsoredOffers
          ? _value.sponsoredOffers
          : sponsoredOffers // ignore: cast_nullable_to_non_nullable
              as List<SponsoredOfferModel>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OffersResponseModelCopyWith<$Res>
    implements $OffersResponseModelCopyWith<$Res> {
  factory _$$_OffersResponseModelCopyWith(_$_OffersResponseModel value,
          $Res Function(_$_OffersResponseModel) then) =
      __$$_OffersResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'active_offers') List<OfferModel>? activeOffers,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'carCondition') dynamic carCondition,
      @JsonKey(name: 'client_id') String? clientId,
      @JsonKey(name: 'created_at', fromJson: DateTimeParser.parseDateTime)
      DateTime? createdAt,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'maturity') int? maturity,
      @JsonKey(name: 'passive_offers') List<OfferModel>? passiveOffers,
      @JsonKey(name: 'sponsored_offers')
      List<SponsoredOfferModel>? sponsoredOffers,
      @JsonKey(name: 'type') String? type});
}

/// @nodoc
class __$$_OffersResponseModelCopyWithImpl<$Res>
    extends _$OffersResponseModelCopyWithImpl<$Res, _$_OffersResponseModel>
    implements _$$_OffersResponseModelCopyWith<$Res> {
  __$$_OffersResponseModelCopyWithImpl(_$_OffersResponseModel _value,
      $Res Function(_$_OffersResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeOffers = freezed,
    Object? amount = freezed,
    Object? carCondition = freezed,
    Object? clientId = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? maturity = freezed,
    Object? passiveOffers = freezed,
    Object? sponsoredOffers = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_OffersResponseModel(
      activeOffers: freezed == activeOffers
          ? _value._activeOffers
          : activeOffers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      carCondition: freezed == carCondition
          ? _value.carCondition
          : carCondition // ignore: cast_nullable_to_non_nullable
              as dynamic,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      maturity: freezed == maturity
          ? _value.maturity
          : maturity // ignore: cast_nullable_to_non_nullable
              as int?,
      passiveOffers: freezed == passiveOffers
          ? _value._passiveOffers
          : passiveOffers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>?,
      sponsoredOffers: freezed == sponsoredOffers
          ? _value._sponsoredOffers
          : sponsoredOffers // ignore: cast_nullable_to_non_nullable
              as List<SponsoredOfferModel>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OffersResponseModel implements _OffersResponseModel {
  const _$_OffersResponseModel(
      {@JsonKey(name: 'active_offers') final List<OfferModel>? activeOffers,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'carCondition') this.carCondition,
      @JsonKey(name: 'client_id') this.clientId,
      @JsonKey(name: 'created_at', fromJson: DateTimeParser.parseDateTime)
      this.createdAt,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'maturity') this.maturity,
      @JsonKey(name: 'passive_offers') final List<OfferModel>? passiveOffers,
      @JsonKey(name: 'sponsored_offers')
      final List<SponsoredOfferModel>? sponsoredOffers,
      @JsonKey(name: 'type') this.type})
      : _activeOffers = activeOffers,
        _passiveOffers = passiveOffers,
        _sponsoredOffers = sponsoredOffers;

  factory _$_OffersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_OffersResponseModelFromJson(json);

  final List<OfferModel>? _activeOffers;
  @override
  @JsonKey(name: 'active_offers')
  List<OfferModel>? get activeOffers {
    final value = _activeOffers;
    if (value == null) return null;
    if (_activeOffers is EqualUnmodifiableListView) return _activeOffers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'amount')
  final int? amount;
  @override
  @JsonKey(name: 'carCondition')
  final dynamic carCondition;
  @override
  @JsonKey(name: 'client_id')
  final String? clientId;
  @override
  @JsonKey(name: 'created_at', fromJson: DateTimeParser.parseDateTime)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'maturity')
  final int? maturity;
  final List<OfferModel>? _passiveOffers;
  @override
  @JsonKey(name: 'passive_offers')
  List<OfferModel>? get passiveOffers {
    final value = _passiveOffers;
    if (value == null) return null;
    if (_passiveOffers is EqualUnmodifiableListView) return _passiveOffers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SponsoredOfferModel>? _sponsoredOffers;
  @override
  @JsonKey(name: 'sponsored_offers')
  List<SponsoredOfferModel>? get sponsoredOffers {
    final value = _sponsoredOffers;
    if (value == null) return null;
    if (_sponsoredOffers is EqualUnmodifiableListView) return _sponsoredOffers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'type')
  final String? type;

  @override
  String toString() {
    return 'OffersResponseModel(activeOffers: $activeOffers, amount: $amount, carCondition: $carCondition, clientId: $clientId, createdAt: $createdAt, id: $id, maturity: $maturity, passiveOffers: $passiveOffers, sponsoredOffers: $sponsoredOffers, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OffersResponseModel &&
            const DeepCollectionEquality()
                .equals(other._activeOffers, _activeOffers) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other.carCondition, carCondition) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.maturity, maturity) ||
                other.maturity == maturity) &&
            const DeepCollectionEquality()
                .equals(other._passiveOffers, _passiveOffers) &&
            const DeepCollectionEquality()
                .equals(other._sponsoredOffers, _sponsoredOffers) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activeOffers),
      amount,
      const DeepCollectionEquality().hash(carCondition),
      clientId,
      createdAt,
      id,
      maturity,
      const DeepCollectionEquality().hash(_passiveOffers),
      const DeepCollectionEquality().hash(_sponsoredOffers),
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OffersResponseModelCopyWith<_$_OffersResponseModel> get copyWith =>
      __$$_OffersResponseModelCopyWithImpl<_$_OffersResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OffersResponseModelToJson(
      this,
    );
  }
}

abstract class _OffersResponseModel implements OffersResponseModel {
  const factory _OffersResponseModel(
      {@JsonKey(name: 'active_offers') final List<OfferModel>? activeOffers,
      @JsonKey(name: 'amount') final int? amount,
      @JsonKey(name: 'carCondition') final dynamic carCondition,
      @JsonKey(name: 'client_id') final String? clientId,
      @JsonKey(name: 'created_at', fromJson: DateTimeParser.parseDateTime)
      final DateTime? createdAt,
      @JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'maturity') final int? maturity,
      @JsonKey(name: 'passive_offers') final List<OfferModel>? passiveOffers,
      @JsonKey(name: 'sponsored_offers')
      final List<SponsoredOfferModel>? sponsoredOffers,
      @JsonKey(name: 'type') final String? type}) = _$_OffersResponseModel;

  factory _OffersResponseModel.fromJson(Map<String, dynamic> json) =
      _$_OffersResponseModel.fromJson;

  @override
  @JsonKey(name: 'active_offers')
  List<OfferModel>? get activeOffers;
  @override
  @JsonKey(name: 'amount')
  int? get amount;
  @override
  @JsonKey(name: 'carCondition')
  dynamic get carCondition;
  @override
  @JsonKey(name: 'client_id')
  String? get clientId;
  @override
  @JsonKey(name: 'created_at', fromJson: DateTimeParser.parseDateTime)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'maturity')
  int? get maturity;
  @override
  @JsonKey(name: 'passive_offers')
  List<OfferModel>? get passiveOffers;
  @override
  @JsonKey(name: 'sponsored_offers')
  List<SponsoredOfferModel>? get sponsoredOffers;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_OffersResponseModelCopyWith<_$_OffersResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
