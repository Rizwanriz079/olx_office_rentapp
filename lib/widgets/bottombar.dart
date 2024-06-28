import 'package:api/Screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screens/homescreen.dart';
import '../screens/add_post_screen.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(backgroundColor: Colors.white,
      items: const [
         BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'HOME'),
         BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'SELL'),
         BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'ACCOUNT'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Get.to(() => HomeScreen());
            // break;
          case 1:
            Get.to(() => AddPostScreen());
            // break;
          case 2:
            Get.to(() => ProfileScreen());
            // break;
        }
      },
    );
  }
}
