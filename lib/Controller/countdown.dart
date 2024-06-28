import 'package:get/get.dart';
import 'dart:async';  // Import the dart:async library for the Timer class

class CountdownController extends GetxController {
  var start = 30.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    start.value = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start.value == 0) {
        timer.cancel();
      } else {
        start.value--;
      }
    });
  }

  void resetTimer() {
    start.value = 30;
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
