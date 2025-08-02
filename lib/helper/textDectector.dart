import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class TextDetectorHelper {
  Future<String> getRecognizedText(XFile image) async {
    File file = File(image.path);

    final inputImage = InputImage.fromFile(file);

    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final RecognizedText recognizedText = await textRecognizer.processImage(
      inputImage,
    );
    String finalText = "";

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        finalText += "${line.text}\n";
      }
    }

    await textRecognizer.close();
    return finalText;
  }
}
