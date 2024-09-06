import 'dart:io';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/screens/FishFinder/widget/mybutton.dart';
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

  void imageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F5FF),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Image Label example"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: _image != null
                      ? Image.file(
                          File(_image!.path),
                          fit: BoxFit.contain,
                        )
                      : Center(
                          child: Text(
                            'No image selected',
                            style: fontEnglish.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Mybutton(imageFrom: imageFromGallery, camera: false),
                    Mybutton(imageFrom: imageFromCamera, camera: true),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
