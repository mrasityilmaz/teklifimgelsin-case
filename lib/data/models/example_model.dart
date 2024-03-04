import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_model.freezed.dart';
part 'example_model.g.dart';

///
/// If you want to [immutable] class, you should use [@Freezed()]
///
/// If you want to [mutable] class, you should use [@unfreezed]
///
///
/// You can create another one class same like this class
///

@Freezed()
class ExampleModel with _$ExampleModel, EquatableMixin {
  const factory ExampleModel({
    required String name,
    required String password,
  }) = _ExampleModel;

  const ExampleModel._();

  factory ExampleModel.fromJson(Map<String, dynamic> json) => _$ExampleModelFromJson(json);

  @override
  List<Object?> get props => [
        name,
        password,
      ];
}
