library domain;

export 'services/dependency_injection/service_locator.dart';
export 'use_cases/use_cases.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
