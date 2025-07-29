import 'package:all_example/helper/assets_strings.dart';
import 'package:flutter/material.dart';

class Listviewitems extends SearchViewListView {
  // toolspage Data

  List<Map<String, dynamic>> inputFormatData = [
    {"icon": pdfComponent, "title": "PDF File", "type": "PDF"},
    {"icon": wordComponent, "title": "Word File", "type": "Word"},
    {"icon": imgComponent, "title": "IMG'S File", "type": "IMG"},
    {"icon": pptComponent, "title": "PPT File", "type": "PPT"},
    {"icon": excelComponent, "title": "Excel File", "type": "Excel"},
  ];

  List<Map<String, dynamic>> outputFormatData = [
    {"icon": pdfComponent, "title": "PDF File", "type": "PDF"},
    {"icon": wordComponent, "title": "Word File", "type": "Word"},
    {"icon": imgComponent, "title": "IMG'S File", "type": "IMG"},
    {"icon": pptComponent, "title": "PPT File", "type": "PPT"},
    {"icon": excelComponent, "title": "Excel File", "type": "Excel"},
  ];
  List<Map<String, dynamic>> featureToolsData = [
    {"icon": pdfConverter, "title": "Convert to PDF", "type": "PDF"},

    {"icon": textConverter, "title": "Convert to Text", "type": "TXT"},

    {"icon": imgConverter, "title": "Convert to Image", "type": "IMG"},
  ];

  List<Map<String, dynamic>> featureToolsData2 = [
    {"icon": wordToPdf, "title": "Word to PDF", "type": "W to P"},

    {"icon": pdfToText, "title": "PDF To Text", "type": "P to T"},
    {"icon": pdfToImage, "title": "PDF To Image", "type": "P to I"},
    {"icon": imageToPdf, "title": "Image to PDF", "type": "I to P"},
  ];

  Map<String, dynamic> othertoolsdata = {
    "icon": [Image.asset("assets/image/merge_pdf_files.png", scale: 4)],

    "Desc": ["Merge PDF Files"],
  };
}

class SearchViewListView extends DrawerlistItems {
  Map<String, dynamic> searchviewData = {
    "icon": [
      Image.asset("assets/image/pdf.png", scale: 4),
      Image.asset("assets/image/ppt.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
    ],

    "Title": [
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
      "Excel File in List",
    ],

    "Desc": [
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
      "Date 06-06-2025",
    ],
  };
}

class DrawerlistItems extends HomeRecentFiles {
  Map<String, dynamic> drawerItems = {
    "icon": [
      Icon(Icons.home),
      Icon(Icons.history),
      Icon(Icons.folder),
      Icon(Icons.file_copy),
      Icon(Icons.recycling),
      Icon(Icons.settings),
      Icon(Icons.warning),
    ],

    "title": [
      "Home",
      "Recent Files",
      "All Files",
      "Feature Tools",
      "Trash Bin",
      "Settings",
      "About Us",
    ],
  };
}

class HomeRecentFiles extends HomeFolderList {
  Map<String, dynamic> homeRecentFilesList = {
    "icon": [
      Image.asset("assets/image/pdf.png", scale: 4),
      Image.asset("assets/image/ppt.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
      Image.asset("assets/image/ms_word.png", scale: 4),
    ],

    "Desc": [
      "Convert to PDF",
      "Convert to TXT",
      "Convert to IMG",
      "Convert to IMG",
      "Convert to IMG",
      "Convert to IMG",
      "Convert to IMG",
      "Convert to IMG",
      "Convert to IMG",
      "Convert to IMG",
    ],
  };
}

class HomeFolderList {
  Map<String, dynamic> homeFolderList = {
    "icon": [
      Image.asset("assets/image/word_files.png", scale: 4),
      Image.asset("assets/image/pdf_files.png", scale: 4),
      Image.asset("assets/image/ppt_files.png", scale: 4),
      Image.asset("assets/image/scaned_files.png", scale: 4),
      Image.asset("assets/image/favourite_files.png", scale: 4),
    ],
    "title": [
      "Word File",
      "PDF File",
      "PPT File",
      "Scanned File",
      "Favourite File",
    ],

    "desc": ["100 Files", "100 Files", "100 Files", "100 Files", "100 Files"],
  };
}
