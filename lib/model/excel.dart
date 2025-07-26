import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ExcelConverter extends SaveTextToExcel {
  Future<void> convertTextToExcel(String fullText) async {
    var excel = Excel.createExcel();
    Sheet sheet = excel['Sheet1'];

    List<String> lines = fullText.split('\n');
    for (int i = 0; i < lines.length; i++) {
      var cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i),
      );
      cell.value = TextCellValue(lines[i]); // ✅ Correct way
    }

    final dir = await getExternalStorageDirectory();
    final filePath = "${dir!.path}/output.xlsx";

    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    print("✅ Excel file saved at: $filePath");
  }
}

class SaveTextToExcel {
  Future<void> saveTextToExcel(BuildContext context, String text) async {
    final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];

    List<String> lines = text.split('\n');
    for (int i = 0; i < lines.length; i++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i))
          .value = TextCellValue(
        lines[i],
      );
    }

    final dir = await getExternalStorageDirectory();
    final filePath = "${dir!.path}/converted_output.xlsx";
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    // ✅ Show SnackBar with proper context
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("✅ Excel saved at: $filePath")));
  }
}
