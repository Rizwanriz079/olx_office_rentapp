import 'package:api/Screens/homescreen.dart';
import 'package:api/Screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Controller/post_controller.dart';


void main()async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(PostController());
    return GetMaterialApp(
      title: 'OLX App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  SplashScreen(),
    );
  }
}

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: HomeScreen(),
//       bottomNavigationBar: BottomNavBar(),
//     );
//   }
// }
