import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

@immutable
final class LoggerService {
  factory LoggerService() {
    return instance;
  }

  const LoggerService._internal();
  static const LoggerService instance = LoggerService._internal();

  static final Logger logger = Logger();

  void printLog(
    String message,
  ) {
    logger.i(
      message,
    );
  }

  void printErrorLog(Object e, StackTrace s) {
    logger.t(e.toString(), stackTrace: s);
  }

  void catchLog(Object e, StackTrace s) {
    FlutterError.reportError(FlutterErrorDetails(exception: e, stack: s));
  }
}
