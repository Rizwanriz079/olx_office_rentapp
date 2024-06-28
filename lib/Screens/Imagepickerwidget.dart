import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final List<String> images;
  final Function(String) onImageAdded;
  final Function(String) onImageRemoved;

  ImagePickerWidget({required this.images, required this.onImageAdded, required this.onImageRemoved});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      widget.onImageAdded(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: widget.images.map((image) {
            return Stack(
              children: [
                Image.file(
                  File(image),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () => widget.onImageRemoved(image),
                    child: Icon(Icons.remove_circle, color: Colors.red),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _pickImage,
          child: Text('Add Image'),
        ),
      ],
    );
  }
}
