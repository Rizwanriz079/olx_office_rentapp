
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/profile_control.dart';
import '../widgets/bottombar.dart';
import 'Chat_screen.dart';
import 'Edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
          child: Column(
            children: [
              Obx(() {
                final profileImage = _profileController.profileImage.value;
                return CircleAvatar(
                  radius: screenWidth * 0.15,
                  backgroundImage: profileImage != null ? FileImage(profileImage) : null,
                  child: profileImage == null ? Icon(Icons.person, size: screenWidth * 0.15) : null,
                );
              }),
              SizedBox(height: screenHeight * 0.01),
              Obx(() {
                return Text(
                  _profileController.profileName.value,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              Obx(() {
                return Text(
                  _profileController.profileNumber.value,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                  ),
                );
              }),
              SizedBox(height: screenHeight * 0.01),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => EditProfileScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B3760),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              ListTile(
                leading: Icon(Icons.chat, size: screenWidth * 0.08),
                title: Text('Chat', style: TextStyle(fontSize: screenWidth * 0.05)),
                onTap: () {
                  Get.to(() => ChatScreen());
                },
                trailing: Icon(Icons.arrow_forward_ios, size: screenWidth * 0.05),
              ),

              SizedBox(height: screenHeight * 0.02),
              ListTile(
                leading: Icon(Icons.edit_note_outlined, size: screenWidth * 0.08),
                title: Text('Edit Adds', style: TextStyle(fontSize: screenWidth * 0.05)),
                onTap: () {
                  // Get.to(() => EditPostScreen());
                },
                trailing: Icon(Icons.arrow_forward_ios, size: screenWidth * 0.05),
              ),

              SizedBox(height: screenHeight * 0.02),
              ListTile(
                leading: Icon(Icons.logout, size: screenWidth * 0.08),
                title: Text('Logout', style: TextStyle(fontSize: screenWidth * 0.05)),
                onTap: () {
                  _profileController.logout();
                },
                trailing: Icon(Icons.arrow_forward_ios, size: screenWidth * 0.05),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
