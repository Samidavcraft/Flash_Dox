import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ExcelHelper {
  Future<void> saveTextAsExcel(String scannedText) async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      print("Storage permission denied");
      return;
    }

    // Create Excel
    var excel = Excel.createExcel();
    Sheet sheet = excel['Sheet1'];

    // Each line becomes a new row
    List<String> lines = scannedText.split('\n');
    for (int i = 0; i < lines.length; i++) {
      sheet.appendRow([TextCellValue(lines[i])]);
    }

    // Get path to save
    final directory = await getExternalStorageDirectory();
    String outputFile = "${directory!.path}/scanned_text.xlsx";

    // Save file
    File(outputFile)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    print("Excel file saved at: $outputFile");
  }
}
