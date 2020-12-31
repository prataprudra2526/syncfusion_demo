import 'dart:async';

import 'dart:math';

class FakeNetworkStream {
  Stream<int> getData() async* {
    var random = Random(2);

    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield random.nextInt(10);
    }
  }
}
