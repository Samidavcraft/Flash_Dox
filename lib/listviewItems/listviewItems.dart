import 'package:flutter/widgets.dart';

class Listviewitems {
  List<String> inputFormatData = [
    "PDF File",
    "World File",
    "IMG'S",
    "PPT File",
    "Excel File",
  ];

  List<String> outputFormatData = [
    "PDF File",
    "World File",
    "IMG'S",
    "PPT File",
    "Excel File",
  ];

  Map<String, dynamic> featureToolsData = {
    "icon": [
      Image.asset("assets/pdf.png"),
      Image.asset("assets/ppt.png"),
      Image.asset("assets/ms_word.png"),
    ],

    "Desc": ["Convert to PDF", "Convert to TXT", "Convert to IMG"],
  };

  Map<String, dynamic> featureToolsData2 = {
    "icon": [
      Image.asset("assets/pdf.png", width: 40, height: 40),
      Image.asset("assets/ppt.png", width: 40, height: 40),
      Image.asset("assets/ms_word.png", width: 40, height: 40),
      Image.asset("assets/ms_word.png", width: 40, height: 40),
      Image.asset("assets/ms_word.png", width: 40, height: 40),
    ],

    "Desc": [
      "Convert to PDF",
      "Convert to TXT",
      "Convert to IMG",
      "Convert to IMG",
      "Convert to IMG",
    ],
  };
}
