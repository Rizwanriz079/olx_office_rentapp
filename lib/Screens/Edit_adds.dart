import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/post_controller.dart';
import '../models/post_model.dart';
import 'Imagepickerwidget.dart';

class EditPostScreen extends StatefulWidget {
  final Post post;

  EditPostScreen({required this.post});

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final PostController postController = Get.find<PostController>();
  final _formKey = GlobalKey<FormState>();

  late TextEditingController buildingNameController;
  late TextEditingController locationController;
  late TextEditingController priceController;
  late TextEditingController squareFeetController;
  late TextEditingController detailsController;
  late TextEditingController numberOfSeatsController;
  late TextEditingController numberOfCabinsController;
  late TextEditingController washroomsController;
  late TextEditingController floorNumberController;
  late TextEditingController numberOfCarParkingController;
  late TextEditingController airConditionerController;

  List<String> images = [];

  @override
  void initState() {
    super.initState();
    buildingNameController = TextEditingController(text: widget.post.buildingName);
    locationController = TextEditingController(text: widget.post.location);
    priceController = TextEditingController(text: widget.post.price.toString());
    squareFeetController = TextEditingController(text: widget.post.squareFeet.toString());
    detailsController = TextEditingController(text: widget.post.details);
    numberOfSeatsController = TextEditingController(text: widget.post.numberOfSeats.toString());
    numberOfCabinsController = TextEditingController(text: widget.post.numberOfCabins.toString());
    washroomsController = TextEditingController(text: widget.post.washrooms.toString());
    floorNumberController = TextEditingController(text: widget.post.floorNumber.toString());
    numberOfCarParkingController = TextEditingController(text: widget.post.numberOfCarParking.toString());
    airConditionerController = TextEditingController(text: widget.post.airConditioner);
    images = List.from(widget.post.images);
  }

  @override
  void dispose() {
    buildingNameController.dispose();
    locationController.dispose();
    priceController.dispose();
    squareFeetController.dispose();
    detailsController.dispose();
    numberOfSeatsController.dispose();
    numberOfCabinsController.dispose();
    washroomsController.dispose();
    floorNumberController.dispose();
    numberOfCarParkingController.dispose();
    airConditionerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Post'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ImagePickerWidget(
                images: images,
                onImageAdded: (image) {
                  setState(() {
                    images.add(image);
                  });
                },
                onImageRemoved: (image) {
                  setState(() {
                    images.remove(image);
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: buildingNameController,
                decoration: InputDecoration(labelText: 'Building Name'),
                validator: (value) => value!.isEmpty ? 'Please enter building name' : null,
              ),
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) => value!.isEmpty ? 'Please enter location' : null,
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Price'),
                validator: (value) => value!.isEmpty ? 'Please enter price' : null,
              ),
              TextFormField(
                controller: squareFeetController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Square Feet'),
                validator: (value) => value!.isEmpty ? 'Please enter square feet' : null,
              ),
              TextFormField(
                controller: detailsController,
                decoration: InputDecoration(labelText: 'Details'),
                validator: (value) => value!.isEmpty ? 'Please enter details' : null,
              ),
              TextFormField(
                controller: numberOfSeatsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number of Seats'),
                validator: (value) => value!.isEmpty ? 'Please enter number of seats' : null,
              ),
              TextFormField(
                controller: numberOfCabinsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number of Cabins'),
                validator: (value) => value!.isEmpty ? 'Please enter number of cabins' : null,
              ),
              TextFormField(
                controller: washroomsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Washrooms'),
                validator: (value) => value!.isEmpty ? 'Please enter number of washrooms' : null,
              ),
              TextFormField(
                controller: floorNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Floor Number'),
                validator: (value) => value!.isEmpty ? 'Please enter floor number' : null,
              ),
              TextFormField(
                controller: numberOfCarParkingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number of Car Parking'),
                validator: (value) => value!.isEmpty ? 'Please enter number of car parking' : null,
              ),
              TextFormField(
                controller: airConditionerController,
                decoration: InputDecoration(labelText: 'Air Conditioner'),
                validator: (value) => value!.isEmpty ? 'Please enter air conditioner details' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Post updatedPost = Post(
                      id: widget.post.id,
                      buildingName: buildingNameController.text,
                      location: locationController.text,
                      price: double.parse(priceController.text),
                      squareFeet: int.parse(squareFeetController.text),
                      details: detailsController.text,
                      numberOfSeats: int.parse(numberOfSeatsController.text),
                      numberOfCabins: int.parse(numberOfCabinsController.text),
                      washrooms: int.parse(washroomsController.text),
                      floorNumber: int.parse(floorNumberController.text),
                      numberOfCarParking: int.parse(numberOfCarParkingController.text),
                      airConditioner: airConditionerController.text,
                      images: images,
                    );
                    postController.updatePost(updatedPost);
                    Get.back();
                  }
                },
                child: Text('Update Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
