import 'package:flutter/material.dart';

class Listviewitems extends SearchViewListView {
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
      Image.asset("assets/pdf.png", scale: 4),
      Image.asset("assets/ppt.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
      Image.asset("assets/ms_word.png", scale: 4),
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

class HomeFolderList extends ManagerTabsItems {
  Map<String, dynamic> homeFolderList = {
    "icon": [
      Image.asset("assets/word_files.png", scale: 4),
      Image.asset("assets/pdf_files.png", scale: 4),
      Image.asset("assets/favourite_files.png", scale: 4),
      Image.asset("assets/ppt_files.png", scale: 4),
      Image.asset("assets/scaned_files.png", scale: 4),
    ],

    "title": [
      "Word Files",
      "PDF Files",
      "Favourite Files",
      "PPT Files",
      "Scaned Files",
    ],
    "desc": ["110 files", "110 files", "110 files", "110 files", "110 files"],
  };
}

class ManagerTabsItems {
  Map<String, dynamic> tabsItems = {
    "texts": ["Home", "Settings", "Example"],
    "icons": [Icon(Icons.home), Icon(Icons.settings), Icon(Icons.abc)],
  };
}
