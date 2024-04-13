import 'package:flutter/foundation.dart';

import '../../utils/is_test.dart';

Future<R> computeApp<M, R>(
  ComputeCallback<M, R> callback,
  M message, {
  String? debugLabel,
}) async {
  if (kTest) {
    return await callback(message);
  } else {
    return compute<M, R>(callback, message, debugLabel: debugLabel);
  }
}
