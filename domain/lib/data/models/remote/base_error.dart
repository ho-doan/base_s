import 'package:flutter/material.dart';

class ErrorState<T> {
  ErrorState({
    required this.error,
    this.type,
    this.stackTrace,
    this.data,
  });
  final Object error;
  final ErrorType? type;
  final StackTrace? stackTrace;
  T? data;

  String get errorMessage => error.toString();

  @override
  String toString() => '$error, type: $type, data: $data';
}

extension EErrorState on ErrorState? {
  String errorMessageByType(BuildContext context) => this == null
      ? 'AppLanguage.general.anErrorOccurs'
      : this!.type.errorMessage(context);

  void showError({bool ignoreErrorFields = false, String? rightButtonText}) {
    // TODO(hodoan): handle show error
  }
}

enum ErrorType { server, local, other }

extension EErrorType on ErrorType? {
  String get code {
    switch (this) {
      case ErrorType.server:
        return 'S0113';
      case ErrorType.local:
        return 'S0112';
      case ErrorType.other:
      case null:
        return 'E0112';
    }
  }

  String errorMessage(BuildContext context) {
    switch (this) {
      case ErrorType.server:
      // TODO(hodoan): Handle this case.
      case ErrorType.local:
      // TODO(hodoan): Handle this case.
      case ErrorType.other:
      // TODO(hodoan): Handle this case.
      case null:
        return 'AppLanguage.general.anErrorOccurs';
    }
  }
}
