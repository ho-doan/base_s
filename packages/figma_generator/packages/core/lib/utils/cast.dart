// ignore: avoid_annotating_with_dynamic
T? safeCast<T>(dynamic value) => value is T ? value : null;
