import 'package:my_coding_setup/core/errors/errors.dart';

extension FailureExtension on Failure {
  String get getErrorMessage {
    const String defaultErrorMessage = 'An error occurred. Please try again later.';
    switch (runtimeType) {
      case ServerFailure:
        return (this as ServerFailure).errorMessage ?? defaultErrorMessage;

      case CacheFailure:
        return (this as CacheFailure).errorMessage ?? defaultErrorMessage;

      case OfferLimitFailure:
        return (this as OfferLimitFailure).errorMessage;

      case NetworkFailure:
        return 'Network error occurred. Please check your internet connection and try again.';

      case const (UnExpectedFailure<dynamic>):
        return (this as UnExpectedFailure).errorMessage ?? defaultErrorMessage;

      default:
        return defaultErrorMessage;
    }
  }
}
