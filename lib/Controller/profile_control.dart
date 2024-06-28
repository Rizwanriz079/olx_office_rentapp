import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImage = Rxn<File>();
  var profileName = ''.obs;
  var profileNumber = ''.obs;

  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  void updateProfile(String name, String number) {
    profileName.value = name;
    profileNumber.value = number;
  }

  void logout() {
    // Clear user data and navigate to login screen
    profileName.value = '';
    profileNumber.value = '';
    profileImage.value = null;

    Get.offAllNamed('/login');
    // to navigate to login screen if you're using named routes
    // Or Get.offAll(LoginScreen()) if you're using widget navigation
  }
}
