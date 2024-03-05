// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OfferErrorModel _$OfferErrorModelFromJson(Map<String, dynamic> json) {
  return _OfferErrorModel.fromJson(json);
}

/// @nodoc
mixin _$OfferErrorModel {
  @JsonKey(name: 'error_message')
  String? get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_type')
  String? get errorType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferErrorModelCopyWith<OfferErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferErrorModelCopyWith<$Res> {
  factory $OfferErrorModelCopyWith(
          OfferErrorModel value, $Res Function(OfferErrorModel) then) =
      _$OfferErrorModelCopyWithImpl<$Res, OfferErrorModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'error_message') String? errorMessage,
      @JsonKey(name: 'error_type') String? errorType});
}

/// @nodoc
class _$OfferErrorModelCopyWithImpl<$Res, $Val extends OfferErrorModel>
    implements $OfferErrorModelCopyWith<$Res> {
  _$OfferErrorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? errorType = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorType: freezed == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OfferErrorModelCopyWith<$Res>
    implements $OfferErrorModelCopyWith<$Res> {
  factory _$$_OfferErrorModelCopyWith(
          _$_OfferErrorModel value, $Res Function(_$_OfferErrorModel) then) =
      __$$_OfferErrorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'error_message') String? errorMessage,
      @JsonKey(name: 'error_type') String? errorType});
}

/// @nodoc
class __$$_OfferErrorModelCopyWithImpl<$Res>
    extends _$OfferErrorModelCopyWithImpl<$Res, _$_OfferErrorModel>
    implements _$$_OfferErrorModelCopyWith<$Res> {
  __$$_OfferErrorModelCopyWithImpl(
      _$_OfferErrorModel _value, $Res Function(_$_OfferErrorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? errorType = freezed,
  }) {
    return _then(_$_OfferErrorModel(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorType: freezed == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OfferErrorModel implements _OfferErrorModel {
  const _$_OfferErrorModel(
      {@JsonKey(name: 'error_message') this.errorMessage,
      @JsonKey(name: 'error_type') this.errorType});

  factory _$_OfferErrorModel.fromJson(Map<String, dynamic> json) =>
      _$$_OfferErrorModelFromJson(json);

  @override
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @override
  @JsonKey(name: 'error_type')
  final String? errorType;

  @override
  String toString() {
    return 'OfferErrorModel(errorMessage: $errorMessage, errorType: $errorType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfferErrorModel &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, errorType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfferErrorModelCopyWith<_$_OfferErrorModel> get copyWith =>
      __$$_OfferErrorModelCopyWithImpl<_$_OfferErrorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfferErrorModelToJson(
      this,
    );
  }
}

abstract class _OfferErrorModel implements OfferErrorModel {
  const factory _OfferErrorModel(
          {@JsonKey(name: 'error_message') final String? errorMessage,
          @JsonKey(name: 'error_type') final String? errorType}) =
      _$_OfferErrorModel;

  factory _OfferErrorModel.fromJson(Map<String, dynamic> json) =
      _$_OfferErrorModel.fromJson;

  @override
  @JsonKey(name: 'error_message')
  String? get errorMessage;
  @override
  @JsonKey(name: 'error_type')
  String? get errorType;
  @override
  @JsonKey(ignore: true)
  _$$_OfferErrorModelCopyWith<_$_OfferErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
