import 'package:api/Constant.dart';
import 'package:api/Screens/homescreen.dart';
import 'package:flutter/material.dart';
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

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  final CountdownController countdownController = Get.put(CountdownController());

  OtpScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 70),
              const Text('Verification Code', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              const SizedBox(height: 30),
              Image.asset('assets/verif.png', height: 200, width: 200),
              const SizedBox(height: 40),
              Text('Code was sent to +XXX-XXX-${phoneNumber.substring(7)}',style: AppTextStyles.aBeeZee14LightBold),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => SizedBox(
                  width: 50,
                  child: TextField(
                    // controller:,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      counter: Offstage(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 4) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                )),
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () => Get.to(HomeScreen()),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xFF0B3760),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: countdownController.start.value == 0 ? () {
                  countdownController.resetTimer();
                  // Logic to resend the code
                } : null,
                child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      countdownController.start.value == 0
                          ? "Send the code again"
                          : "Resend code in ${countdownController.start.value} seconds",
                      style: const TextStyle(letterSpacing: 0.5),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
