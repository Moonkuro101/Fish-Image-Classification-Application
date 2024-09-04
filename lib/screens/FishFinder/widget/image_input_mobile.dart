// image_input_mobile.dart
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onSelectedImage});

  final void Function(dynamic image) onSelectedImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _pickedImage() async {
    final ImagePicker picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 600,
    );

    if (imageFile == null) {
      return;
    }

    setState(() {
      _selectedImage = File(imageFile.path);
    });

    widget.onSelectedImage(_selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _pickedImage,
      label: const Text('Select an image'),
      icon: const Icon(Icons.camera),
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _pickedImage,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.contain,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: content,
    );
  }
}
