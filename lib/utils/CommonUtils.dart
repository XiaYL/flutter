import 'dart:async';

class TimerUtils {
  Timer timer;
  createTimer(millseconds, callback) {
    timer = Timer(Duration(milliseconds: millseconds), callback);
    return timer;
  }

  releaseTimer() {
    if (timer != null) {
      timer.cancel();
    }
  }
}
