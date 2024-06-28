import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Controller/profile_control.dart';

class EditProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.find<ProfileController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  EditProfileScreen({super.key}) {
    nameController.text = profileController.profileName.value;
    numberController.text = profileController.profileNumber.value;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
        child: Column(
          children: [
            Obx(() {
              return CircleAvatar(
                radius: screenWidth * 0.15,
                backgroundImage: profileController.profileImage.value != null
                    ? FileImage(profileController.profileImage.value!)
                    : null,
                child: profileController.profileImage.value == null
                    ? Icon(Icons.person, size: screenWidth * 0.15)
                    : null,
              );
            }),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.photo_library),
                          title: const Text('Gallery'),
                          onTap: () {
                            profileController.pickImage(ImageSource.gallery);
                            Get.back();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo_camera),
                          title: const Text('Camera'),
                          onTap: () {
                            profileController.pickImage(ImageSource.camera);
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text('Change Profile Image'),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Column(
                children: [
                  _buildTextField(label: 'Name', controller: nameController, screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(label: 'Change number', controller: numberController, screenWidth: screenWidth,keyboardType: TextInputType.phone),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: () {
                profileController.updateProfile(
                  nameController.text,
                  numberController.text,
                );
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0B3760),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required TextEditingController controller, required double screenWidth, TextInputType keyboardType = TextInputType.text}) {
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.3, // Adjust according to your preference
          child: Text(
            label,
            style: const TextStyle(color: Color(0xFF0B3760)),
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
