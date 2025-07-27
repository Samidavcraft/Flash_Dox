import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class TextDetectorHelper {
  Future<String> getRecognizedText(XFile image) async {
    final textDetector = GoogleMlKit.vision.textRecognizer();
    String finalText = "";

    final inputImage = InputImage.fromFilePath(image.path);
    RecognizedText recognizedText = await textDetector.processImage(inputImage);

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        finalText += "${line.text}\n";
      }
    }

    await textDetector.close();
    return finalText;
  }
}
