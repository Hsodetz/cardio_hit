import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CounterNotifier extends ChangeNotifier {
  Duration duration = const Duration(seconds: 8);
  bool isRunning = false;
  bool isEnding = false;
  StreamSubscription? _tickSubscription;
  int cicle = 0;


  void startStopTimer() {

    if (!isRunning) {
      _startTimer(duration.inSeconds);

    } else {
      // Pusar el timer
      _tickSubscription?.pause();
    }

    isRunning = !isRunning;
    notifyListeners();

  }

  void _startTimer(int seconds) {
    _tickSubscription?.cancel();

    _tickSubscription = Stream<int>.periodic(const Duration(seconds: 1), (sec) => seconds - sec - 1)
    .take(seconds)
    .listen((timeLeftInseconds) { 
      duration = Duration(seconds: timeLeftInseconds);

      if (duration <= const Duration(seconds: 0)) {
        isRunning = false;
        _startTimer(60);
        cicle++;
        if(cicle == 3) {
          _tickSubscription?.pause();
          isEnding = true;
          notifyListeners();
        }
      
        notifyListeners();
      }

      notifyListeners();

    });

  }

  String get timeLeftString {
    final minutes =
        ((duration.inSeconds / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds =
        (duration.inSeconds % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String get timeSecondString {
    final seconds =
        (duration.inSeconds % 60).floor().toString().padLeft(2, '0');
    return seconds;
  }
}

final counterProvider = ChangeNotifierProvider<CounterNotifier>((ref) {
  return CounterNotifier();
});