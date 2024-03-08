// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_params_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchParamsModel _$SearchParamsModelFromJson(Map<String, dynamic> json) {
  return _SearchParamsModel.fromJson(json);
}

/// @nodoc
mixin _$SearchParamsModel {
  double get amount => throw _privateConstructorUsedError;
  int get expiry => throw _privateConstructorUsedError;
  LoanTypeEnum get loanType => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime? get savedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchParamsModelCopyWith<SearchParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchParamsModelCopyWith<$Res> {
  factory $SearchParamsModelCopyWith(
          SearchParamsModel value, $Res Function(SearchParamsModel) then) =
      _$SearchParamsModelCopyWithImpl<$Res, SearchParamsModel>;
  @useResult
  $Res call(
      {double amount,
      int expiry,
      LoanTypeEnum loanType,
      String id,
      DateTime? savedTime});
}

/// @nodoc
class _$SearchParamsModelCopyWithImpl<$Res, $Val extends SearchParamsModel>
    implements $SearchParamsModelCopyWith<$Res> {
  _$SearchParamsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? expiry = null,
    Object? loanType = null,
    Object? id = null,
    Object? savedTime = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as int,
      loanType: null == loanType
          ? _value.loanType
          : loanType // ignore: cast_nullable_to_non_nullable
              as LoanTypeEnum,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      savedTime: freezed == savedTime
          ? _value.savedTime
          : savedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchParamsModelCopyWith<$Res>
    implements $SearchParamsModelCopyWith<$Res> {
  factory _$$_SearchParamsModelCopyWith(_$_SearchParamsModel value,
          $Res Function(_$_SearchParamsModel) then) =
      __$$_SearchParamsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount,
      int expiry,
      LoanTypeEnum loanType,
      String id,
      DateTime? savedTime});
}

/// @nodoc
class __$$_SearchParamsModelCopyWithImpl<$Res>
    extends _$SearchParamsModelCopyWithImpl<$Res, _$_SearchParamsModel>
    implements _$$_SearchParamsModelCopyWith<$Res> {
  __$$_SearchParamsModelCopyWithImpl(
      _$_SearchParamsModel _value, $Res Function(_$_SearchParamsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? expiry = null,
    Object? loanType = null,
    Object? id = null,
    Object? savedTime = freezed,
  }) {
    return _then(_$_SearchParamsModel(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as int,
      loanType: null == loanType
          ? _value.loanType
          : loanType // ignore: cast_nullable_to_non_nullable
              as LoanTypeEnum,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      savedTime: freezed == savedTime
          ? _value.savedTime
          : savedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchParamsModel implements _SearchParamsModel {
  const _$_SearchParamsModel(
      {required this.amount,
      required this.expiry,
      required this.loanType,
      required this.id,
      this.savedTime});

  factory _$_SearchParamsModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchParamsModelFromJson(json);

  @override
  final double amount;
  @override
  final int expiry;
  @override
  final LoanTypeEnum loanType;
  @override
  final String id;
  @override
  final DateTime? savedTime;

  @override
  String toString() {
    return 'SearchParamsModel(amount: $amount, expiry: $expiry, loanType: $loanType, id: $id, savedTime: $savedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchParamsModel &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.expiry, expiry) || other.expiry == expiry) &&
            (identical(other.loanType, loanType) ||
                other.loanType == loanType) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.savedTime, savedTime) ||
                other.savedTime == savedTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, expiry, loanType, id, savedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchParamsModelCopyWith<_$_SearchParamsModel> get copyWith =>
      __$$_SearchParamsModelCopyWithImpl<_$_SearchParamsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchParamsModelToJson(
      this,
    );
  }
}

abstract class _SearchParamsModel implements SearchParamsModel {
  const factory _SearchParamsModel(
      {required final double amount,
      required final int expiry,
      required final LoanTypeEnum loanType,
      required final String id,
      final DateTime? savedTime}) = _$_SearchParamsModel;

  factory _SearchParamsModel.fromJson(Map<String, dynamic> json) =
      _$_SearchParamsModel.fromJson;

  @override
  double get amount;
  @override
  int get expiry;
  @override
  LoanTypeEnum get loanType;
  @override
  String get id;
  @override
  DateTime? get savedTime;
  @override
  @JsonKey(ignore: true)
  _$$_SearchParamsModelCopyWith<_$_SearchParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
