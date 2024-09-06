import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  File? _image;
  late ImagePicker _picker;
  late ImageLabeler _imageLabeler;
  String result = 'Result will be shown here';

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
    loadModel();
  }

  loadModel() async {
    final modelPath = await getModelPath('assets/ml/fish_metadata.tflite');
    final options = LocalLabelerOptions(
      confidenceThreshold: 0.5,
      modelPath: modelPath,
    );
    _imageLabeler = ImageLabeler(options: options);
  }

  void doImageLabeling() async {
    if (_image == null) return;

    // Pre-process the image by resizing and normalizing the pixel values.
    InputImage inputImage = InputImage.fromFile(_image!);

    // Process image using the loaded TensorFlow Lite model.
    final List<ImageLabel> labels =
        await _imageLabeler.processImage(inputImage);

    result = '';
    for (ImageLabel label in labels) {
      final String text = label.label;
      final double confidence = label.confidence;
      result += '$text: ${confidence.toStringAsFixed(2)}\n';
    }

    setState(() {
      // Update the result in the UI.
    });
  }

  Future<String> getModelPath(String asset) async {
    final path = '${(await getApplicationSupportDirectory()).path}/$asset';
    await Directory(dirname(path)).create(recursive: true);
    final file = File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(asset);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

  void imageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }
    setState(() {
      _image = File(pickedFile.path);
    });

    // Start image labeling after the image is picked
    doImageLabeling();
  }

  @override
  void dispose() {
    // Clean up resources
    _imageLabeler.close();
    super.dispose();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('FishFinder'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _image == null
              ? const Icon(
                  Icons.image,
                  size: 100,
                )
              : Image.file(
                  _image!,
                  width: 200,
                  height: 200,
                ),
          Center(
            child: ElevatedButton(
              onPressed: imageFromGallery,
              child: const Text('Choose Image'),
            ),
          ),
          const SizedBox(height: 20),
          Text(result),
        ],
      ),
    );
  }
}
