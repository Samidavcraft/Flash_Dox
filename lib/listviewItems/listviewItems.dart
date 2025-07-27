import 'package:flutter/material.dart';

class Listviewitems extends SearchViewListView {
  // toolspage Data

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

  List<Map<String, dynamic>> featureToolsData = [
    {"icon": "pdf_converter.png", "title": "Convert to PDF", "type": "PDF"},

    {"icon": "txt_converter.png", "title": "Convert to Text", "type": "TXT"},

    {"icon": "imgg_converter.png", "title": "Convert to Image", "type": "IMG"},
  ];

  List<Map<String, dynamic>> featureToolsData2 = [
    {"icon": "word_to_pdf.png", "title": "Word to PDF", "type": "W to P"},

    {"icon": "pdf_to_txt.png", "title": "PDF To Text", "type": "P to T"},
    {"icon": "pdf_to_img.png", "title": "PDF To Image", "type": "P to I"},
    {"icon": "img_to_pdf.png", "title": "Image to PDF", "type": "I to P"},
  ];

  Map<String, dynamic> othertoolsdata = {
    "icon": [Image.asset("assets/merge_pdf_files.png", scale: 4)],

    "Desc": ["Merge PDF Files"],
  };
}

class SearchViewListView extends DrawerlistItems {
  Map<String, dynamic> searchviewData = {
    "icon": [
      Image.asset("assets/pdf.png", scale: 4),
      Image.asset("assets/ppt.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
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
      Image.asset("assets/pdf.png"),
      Image.asset("assets/ppt.png"),
      Image.asset("assets/ms_word.png"),
      Image.asset("assets/ms_word.png"),
      Image.asset("assets/ms_word.png"),
      Image.asset("assets/ms_word.png"),
      Image.asset("assets/ms_word.png"),
      Image.asset("assets/ms_word.png"),
      Image.asset("assets/ms_word.png"),
      Image.asset("assets/ms_word.png"),
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
      Image.asset("assets/word_files.png", scale: 4),
      Image.asset("assets/pdf_files.png", scale: 4),
      Image.asset("assets/ppt_files.png", scale: 4),
      Image.asset("assets/scaned_files.png", scale: 4),
      Image.asset("assets/favourite_files.png", scale: 4),
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
