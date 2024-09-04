// hero_screen.dart
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:fish_finder/screens/FishFinder/widget/image_input.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  File? _selectedImageFile;      // For mobile
  Uint8List? _selectedImageBytes; // For web

  void _selectedImage(dynamic image) {
    if (!kIsWeb) {
      setState(() {
        _selectedImageFile = image as File?;
      });
    } else {
      setState(() {
        _selectedImageBytes = image as Uint8List?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FishFinder'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageInput(
                  onSelectedImage: _selectedImage,
                ),
                const SizedBox(height: 20),
                if (_selectedImageFile != null) ...[
                  const Text('Selected Image (Mobile):'),
                  Image.file(_selectedImageFile!),
                ],
                if (_selectedImageBytes != null) ...[
                  const Text('Selected Image (Web):'),
                  Image.memory(_selectedImageBytes!),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
