import 'dart:io';
import 'package:api/Constant.dart';
import 'package:api/widgets/bottombar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Controller/post_controller.dart';
import '../models/post_model.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final PostController postController = Get.find();
  List<XFile?> selectedImages = List.filled(4, null);
  final ImagePicker _picker = ImagePicker();

  // final titleController = TextEditingController();
  final buildingNameController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();
  final squareFeetController = TextEditingController();
  final numberOfCabinsController = TextEditingController();
  final detailsController = TextEditingController();
  final washroomsController = TextEditingController();
  final floorNumberController = TextEditingController();
  final numberOfSeatsController = TextEditingController();
  final CarParkingContoller = TextEditingController();
  bool carParking = false;
  String airConditioner = 'Non-AC';

  Future<void> pickImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImages[index] = pickedFile;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      double price;
      try {
        price = double.parse(priceController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Invalid Price"),
              content: Text("Please enter a valid price."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        return;
      }

      // Ensure all selected images are added to the post
      final imagePaths = selectedImages.where((image) => image != null).map((image) => image!.path).toList();

      final post = Post(
        // title: titleController.text,
        buildingName: buildingNameController.text,
        price: price,
        location: locationController.text,
        squareFeet: int.parse(squareFeetController.text),
        numberOfCabins: int.parse(numberOfCabinsController.text),
        details: detailsController.text,
        washrooms: int.parse(washroomsController.text),
        floorNumber: int.parse(floorNumberController.text),
        numberOfSeats: int.parse(numberOfSeatsController.text),
        images: imagePaths,
        numberOfCarParking: int.parse(CarParkingContoller.text),
        airConditioner: airConditioner, id: '',
      );
      postController.addPost(post);
      Get.back();
    }
  }

  Widget _buildImagePickerGrid(double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight * 0.3, // 30% of the screen height
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items in a row
            childAspectRatio: 1.7,
            mainAxisSpacing: 2
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => pickImage(index), // Trigger pickImage method on tap
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: selectedImages[index] != null
                  ? kIsWeb
                  ? Image.network(selectedImages[index]!.path, fit: BoxFit.cover)
                  : Image.file(File(selectedImages[index]!.path), fit: BoxFit.cover)
                  : Icon(Icons.add_a_photo, size: screenWidth * 0.1, color: Colors.grey[700]),
            ),
          );
        },
      ),
    );
  }


  Widget _buildFormFields(double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04), // Set padding based on screen width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _buildTextField(label: 'Title', controller: titleController, screenWidth: screenWidth)
          _buildTextField(label: 'Building Name', controller: buildingNameController, screenWidth: screenWidth),
          kheight15,
          _buildTextField(label: 'Price', controller: priceController, keyboardType: TextInputType.number, screenWidth: screenWidth),
          kheight15,
          _buildTextField(label: 'Location', controller: locationController, screenWidth: screenWidth),
          kheight15,
          _buildTextField(label: 'Square Feet', controller: squareFeetController, keyboardType: TextInputType.number, screenWidth: screenWidth),
          kheight15,
          _buildTextField(label: 'Number of Cabins', controller: numberOfCabinsController, keyboardType: TextInputType.number, screenWidth: screenWidth),
          kheight15,
          _buildTextField(label: 'details', controller: detailsController,  screenWidth: screenWidth),
          kheight15,
          _buildTextField(label: 'Washrooms', controller: washroomsController, keyboardType: TextInputType.number, screenWidth: screenWidth),
          kheight15,
          _buildTextField(label: 'Floor Number', controller: floorNumberController, keyboardType: TextInputType.number, screenWidth: screenWidth),
          kheight15,
          _buildTextField(label: 'Number of Seats', controller: numberOfSeatsController, keyboardType: TextInputType.number, screenWidth: screenWidth),
          kheight15,
          _buildTextField(label: 'Car Parking', controller: CarParkingContoller, keyboardType: TextInputType.number, screenWidth: screenWidth),
          kheight15,
          _buildDropdownField(
            label: 'Air Conditioner',
            value: airConditioner,
            onChanged: (newValue) {
              setState(() {
                airConditioner = newValue!;
              });
            },
            items: ['AC', 'Non-AC'],
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    required double screenWidth,
  }) {
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.3, // Set width based on screen width
          child: Text(
            label,
            style: const TextStyle(color: Color(0xFF0B3760)),
          ),
        ),
        kwidth10,
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

  // Widget _buildCheckboxField({
  //   required String label,
  //   required bool value,
  //   required ValueChanged<bool?> onChanged,
  // }) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: Text(
  //           label,
  //           style: const TextStyle(color: Color(0xFF0B3760)),
  //         ),
  //       ),
  //       Checkbox(
  //         value: value,
  //         onChanged: onChanged,
  //       ),
  //     ],
  //   );
  // }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required ValueChanged<String?> onChanged,
    required List<String> items,
    required double screenWidth,
  }) {
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.3,
          child: Text(
            label,
            style: const TextStyle(color: Color(0xFF0B3760)),
          ),
        ),
        kwidth10,
        Expanded(
          child: DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.25),
      child: ElevatedButton(
        onPressed: _submit,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0B3760),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02)),
        child: Text('Save',
          style: TextStyle(color: Colors.white,fontSize: screenHeight * 0.02),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildImagePickerGrid(screenHeight, screenWidth),
                SizedBox(height: 16),
                _buildFormFields(screenWidth),
                _buildSaveButton(screenHeight, screenWidth),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
