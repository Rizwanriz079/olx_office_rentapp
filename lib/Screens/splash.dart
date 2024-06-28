import 'package:api/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'Login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),(){
      Get.off(()=> const LoginPage());
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 150),
           Text("OFFICEX",style: AppTextStyles.aBeeZee30BoldB),
          const SizedBox(height: 120),
          Center(child: Image.asset("assets/splash.png",width: MediaQuery.of(context).size.width *0.8,)),
          const Spacer(),
        ],
      ),
    );
  }
}