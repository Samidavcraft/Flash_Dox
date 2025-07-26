import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class TextDetectorHelper {
  Future<String> getRecognizedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();

    String text = "";
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        text += "${line.text}\n";
      }
    }

    return text;
  }
}
