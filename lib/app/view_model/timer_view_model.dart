import 'dart:async';
import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier {
  bool isPlaying = false;
  Timer? timer;
  Duration duration = Duration.zero;

  void startTimer(int initialMinutes) {
    duration = Duration.zero;
    notifyListeners();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (duration.inMinutes < initialMinutes) {
        duration += Duration(seconds: 1);
        notifyListeners();
      } else {
        isPlaying = false;
        timer.cancel();
      }
    });
  }

  void stopTime() {
    isPlaying = false;
    timer?.cancel();
  }
}
