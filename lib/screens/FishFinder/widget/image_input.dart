// image_input.dart

// This file will conditionally import the correct version of the ImageInput widget
// based on the platform (mobile or web).

export 'image_input_mobile.dart' if (dart.library.html) 'image_input_web.dart';
