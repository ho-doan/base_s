import 'dart:async';

typedef ComputeCallback<M, R> = FutureOr<R> Function(M message);

Future<R> computeApp<M, R>(
  ComputeCallback<M, R> callback,
  M message, {
  String? debugLabel,
}) async {
  // final Completer<R> completer = Completer();
  // final worker = Worker('worker.js');
  // final Timer timer = Timer.periodic(const Duration(seconds: 30), (_) {
  //   log('message === ${_.tick}');
  //   if (_.tick == 15) {
  //     _.cancel();
  //     completer.complete(null);
  //   }
  // });
  // worker.onMessage.listen((e) async {
  //   final result = await callback.call((e.data as Map)['message'] as M);
  //   timer.cancel();
  //   completer.complete(result);
  // });
  // worker.postMessage({'message': message});
  // return completer.future;
  return await callback(message);
}
