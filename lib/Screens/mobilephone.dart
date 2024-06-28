import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otpscreen.dart';

class Mobile_Phone extends StatelessWidget {
  Mobile_Phone({super.key});

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/otp.png', height: 200, width: 200),
              const SizedBox(height: 20),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF9C9C9C)),
                  ),
                  labelText: 'Phone Number',
                  labelStyle: const TextStyle(color: Color(0xFF9C9C9C)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (phoneController.text.length == 10) {
                    Get.to(() => OtpScreen(phoneNumber: phoneController.text));
                  } else {
                    Get.snackbar("Error", "Please enter a valid 10-digit phone number");
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xFF0B3760),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Send Otp",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
