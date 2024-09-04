// image_input_web.dart
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:typed_data';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onSelectedImage});

  final void Function(dynamic image) onSelectedImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  Uint8List? imageFile;
  bool imageAvailable = false;

  void _pickedImage() async {
    final image = await ImagePickerWeb.getImageAsBytes();
    if (image == null) {
      return;
    }
    setState(() {
      imageFile = image;
      imageAvailable = true;
    });

    widget.onSelectedImage(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _pickedImage,
      label: const Text('Select an image'),
      icon: const Icon(Icons.camera),
    );

    if (imageAvailable && imageFile != null) {
      content = GestureDetector(
        onTap: _pickedImage,
        child: Image.memory(
          imageFile!,
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
