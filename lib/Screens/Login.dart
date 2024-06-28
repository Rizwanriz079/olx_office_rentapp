import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant.dart';
import 'mobilephone.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 110,
              ),
               Center(
                child: Text(
                  "Login",
                  style: AppTextStyles.aBeeZee30Bold,
                ),
              ),
              kheight20,
              Image.asset("assets/login.png"),
              const SizedBox(
                height: 50),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to( Mobile_Phone());
                  },
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          "https://cdn-icons-png.freepik.com/256/15/15874.png?ga=GA1.1.464696908.1675963788&semt=ais_hybrid",
                          height: 20,
                          width: 20),
                      kwidth10,
                      const Text('Continue with Mobile',style: TextStyle(color:Color(0xFF9C9C9C) ),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 2,
                        width: 155,
                        color: Colors.black.withOpacity(0.1)),
                    const Text("or"),
                    Container(
                        height: 2,
                        width: 155,
                        color: Colors.black.withOpacity(0.1)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          "https://cdn-icons-png.flaticon.com/128/281/281764.png",
                          height: 20,
                          width: 20),
                      const SizedBox(width: 10),
                      const Text('Continue with Google',style: TextStyle(color:Color(0xFF9C9C9C) ),),
                    ],
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
