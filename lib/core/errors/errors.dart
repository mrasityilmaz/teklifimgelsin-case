import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure([this.properties = const <dynamic>[]]);
  final List<Object?> properties;

  @override
  List<Object?> get props => properties;
}

// General failures
class NetworkFailure extends Failure {
  NetworkFailure() : super([]);
}

class ServerFailure extends Failure {
  ServerFailure({this.errorMessage}) : super([errorMessage]);
  final String? errorMessage;
}

class CacheFailure extends Failure {
  CacheFailure({this.errorMessage}) : super([errorMessage]);
  final String? errorMessage;
}

class UnExpectedFailure<T> extends Failure {
  UnExpectedFailure({this.errorMessage, this.data}) : super([errorMessage, data]);
  final String? errorMessage;
  final T? data;
}

class OfferLimitFailure extends Failure {
  OfferLimitFailure({required this.errorMessage, required this.errorAmountValue, required this.errorExpiryValue}) : super([errorMessage, errorAmountValue, errorExpiryValue]);
  final String errorMessage;
  final int errorExpiryValue;
  final double errorAmountValue;
}
