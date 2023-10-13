import 'dart:async';

class IntervalEmitter {
  Stream<E> stream<E>(Duration interval) => Stream.periodic(interval);
}
