import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image/image.dart' as img;
import 'package:fish_finder/screens/FishFinder/widget/image_input.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  File? _selectedImageFile; // For mobile
  Uint8List? _selectedImageBytes; // For web
  List<dynamic>? _results; // To store the model's output

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  // Load the TFLite model
  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model/Fish_use.tflite", // Path to your TFLite model
      labels: "assets/model/labels.txt", // Path to your labels file
    );
  }

  // Handle image selection for both web and mobile
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

  // Preprocess the image for model input
  Uint8List preprocessImage(Uint8List imageBytes) {
    img.Image image = img.decodeImage(imageBytes)!;
    img.Image resizedImage = img.copyResize(image,
        width: 224, height: 224); // Assuming 224x224 input size
    return resizedImage.getBytes();
  }

  // Run the model on the selected image
  Future<void> runModelOnImage() async {
    if (!kIsWeb && _selectedImageFile != null) {
      final Uint8List imageBytes = await _selectedImageFile!.readAsBytes();
      final processedImageBytes = preprocessImage(imageBytes);
      var output = await Tflite.runModelOnBinary(
        binary: processedImageBytes,
        numResults: 5,
        threshold: 0.5,
      );
      setState(() {
        _results = output;
      });
    } else if (kIsWeb && _selectedImageBytes != null) {
      final processedImageBytes = preprocessImage(_selectedImageBytes!);
      var output = await Tflite.runModelOnBinary(
        binary: processedImageBytes,
        numResults: 5,
        threshold: 0.5,
      );
      setState(() {
        _results = output;
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
                ElevatedButton(
                  onPressed: runModelOnImage, // Run the model when pressed
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 20),
                if (_results != null) ...[
                  const Text('Results:'),
                  Column(
                    children: _results!
                        .map((result) => Text(
                              "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                            ))
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
