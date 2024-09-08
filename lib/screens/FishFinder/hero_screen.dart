import 'dart:io';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/model/fish.dart';
import 'package:fish_finder/provider/fish_provider.dart';
import 'package:fish_finder/screens/FishFinder/widget/mybutton.dart';
import 'package:fish_finder/screens/fish_category_screen/widget/my_list_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class HeroScreen extends ConsumerStatefulWidget {
  const HeroScreen({super.key});
  @override
  ConsumerState<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends ConsumerState<HeroScreen> {
  File? _image;
  Fish? fish;
  late ImagePicker _picker;
  late ImageLabeler _imageLabeler;
  String result = 'Result will be shown here';
  var _fishName;
  bool loadImage = false;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
    loadModel();
  }

  Future<void> loadModel() async {
    final modelPath = await getModelPath('assets/ml/fish_metadata.tflite');
    final options = LocalLabelerOptions(
      confidenceThreshold: 0.5,
      modelPath: modelPath,
    );
    _imageLabeler = ImageLabeler(options: options);
  }

  Future<void> doImageLabeling() async {
    if (_image == null) return;

    setState(() {
      loadImage = true;
    });

    try {
      InputImage inputImage = InputImage.fromFile(_image!);
      final List<ImageLabel> labels =
          await _imageLabeler.processImage(inputImage);

      result = '';
      for (ImageLabel label in labels) {
        var text = label.label;
        final double confidence = label.confidence;
        int spaceIndex = text.indexOf(' ');
        if (spaceIndex != -1) {
          text = text.substring(spaceIndex + 1);
        }
        _fishName = text;
        result += '$text: ${confidence.toStringAsFixed(2)}\n';
      }

      if (result.isNotEmpty) {
        final fishList = ref.watch(fishlistProvider);
        fish = findFishByName(_fishName, fishList);
      }
    } catch (e) {
      result = 'Error occurred: $e';
    } finally {
      setState(() {
        loadImage = false;
      });
    }
  }

  Fish? findFishByName(String? name, List<Fish> fishList) {
    if (name == null || name.isEmpty) return null;

    final trimmedName = name.trim().toLowerCase();

    for (var fish in fishList) {
      if (fish.name.trim().toLowerCase() == trimmedName) {
        return fish;
      }
    }

    return null;
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

  Future<void> imageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    setState(() {
      _image = File(pickedFile.path);
    });

    // Start image labeling after the image is picked
  }

  Future<void> imageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;

    setState(() {
      _image = File(pickedFile.path);
    });

    // Start image labeling after the image is picked
  }

  @override
  void dispose() {
    _imageLabeler.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200,
        centerTitle: true,
        title: const Text("Image Label example"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightBlue.shade200,
                Colors.white,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 350,
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
                    Expanded(
                        child: Mybutton(
                            imageFrom: imageFromGallery, camera: false)),
                    Expanded(
                        child:
                            Mybutton(imageFrom: imageFromCamera, camera: true)),
                  ],
                ),
                if (fish != null)
                  SizedBox(
                    height: 150, // Adjust height as needed
                    child: MyListView(fishList: [fish!]),
                  ),
                ElevatedButton(
                  onPressed: _image == null ? null : doImageLabeling,
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey[400],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: Text(
                    'Submit',
                    style: fontEnglish.copyWith(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: loadImage
                      ? const CircularProgressIndicator()
                      : Text(
                          result.isEmpty ? 'Unknown Fish' : result,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
