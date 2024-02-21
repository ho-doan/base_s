import 'package:flutter/foundation.dart';

import '../../utils/is_test.dart';

Future<R> computeApp<M, R>(
  ComputeCallback<M, R> callback,
  M message, {
  String? debugLabel,
}) async {
  if (!kIsWeb && kTest) {
    return await callback(message);
  } else {
    final r = await compute<M, R>(callback, message, debugLabel: debugLabel);
    return r;
  }
}
