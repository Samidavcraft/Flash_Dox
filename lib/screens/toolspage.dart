import 'dart:io';

import 'package:all_example/helper/assets_strings.dart';
import 'package:all_example/listviewItems/listviewItems.dart';
import 'package:all_example/helper/textDectector.dart';
import 'package:all_example/screens/helper_screen/futuretools_Screen.dart';

import 'package:all_example/themes/textsize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Toolspage extends StatefulWidget {
  const Toolspage({super.key});

  @override
  State<Toolspage> createState() => _ToolspageState();
}

class _ToolspageState extends State<Toolspage> {
  final AppWidgetSizer appsizer = AppWidgetSizer();

  // input DropdownButton
  Map<String, dynamic>? inputCurrentItem;
  // output DropdownButton
  Map<String, dynamic>? outputCurrentItem;

  // listview for DropDownButton and Future ListView
  Listviewitems listviewitems = Listviewitems();
  // for Icon Size and Text Font Size
  final AppWidgetSizer _appWidgetSizer = AppWidgetSizer();

  // for Image Picker
  ImagePicker imagePicker = ImagePicker();

  // for path
  XFile? file;

  // for Scanned Text
  String scannedText = "";

  // text Detector Helper
  TextDetectorHelper textDetectorHelper = TextDetectorHelper();

  // dropdown button disable
  bool isDisable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          margin: EdgeInsets.only(left: 3.w),
          child: Row(
            children: [
              Image.asset(
                appBarIcon,
                width: appsizer.appBarIconSize(),
                height: appsizer.appBarIconSize(),
              ),
              SizedBox(width: 1.w),
              Text(
                "Converter",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: appsizer.appBarTextSize(),
                ),
              ),
            ],
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    children: const [
                      ListTile(title: Text("data")),
                      ListTile(title: Text("data")),
                      ListTile(title: Text("data")),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 4.w, top: 2.h),
                child: Text(
                  "General Converter",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppWidgetSizer.greycolor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, top: 1.h),
                child: Text(
                  "Input",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppWidgetSizer.greycolor,
                  ),
                ),
              ),
              SizedBox(height: 2.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: DropdownButton<Map<String, dynamic>>(
                          hint: Text(
                            "Select Input Format",
                            style: TextStyle(
                              color: AppWidgetSizer.greycolor,
                              fontSize: 15.sp,
                            ),
                          ),
                          isExpanded: true,
                          iconSize: 20.sp,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          underline: const SizedBox(),
                          value: inputCurrentItem,

                          items: listviewitems.inputFormatData
                              .map<DropdownMenuItem<Map<String, dynamic>>>((
                                Map<String, dynamic> value,
                              ) {
                                return DropdownMenuItem<Map<String, dynamic>>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      Image.asset(value["icon"], scale: 4),
                                      SizedBox(width: 3.w),
                                      Text(
                                        value["title"],
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                );
                              })
                              .toList(),
                          onChanged: (Map<String, dynamic>? value) {
                            setState(() {
                              isDisable = true;
                              inputCurrentItem = value;

                              Map<String, dynamic> selectedItem = listviewitems
                                  .inputFormatData
                                  .firstWhere(
                                    (item) => item['type'] == value?['type'],
                                  );

                              if (selectedItem['type'] == 'PDF') {
                                listviewitems.outputFormatData.isEmpty
                                    ? print("Empty")
                                    : listviewitems.outputFormatData =
                                          listviewitems.inputFormatData
                                              .where(
                                                (item) =>
                                                    item['type'] == 'Word' ||
                                                    item['type'] == 'IMG',
                                              )
                                              .toList();
                              } else if (selectedItem['type'] == 'Word') {
                                listviewitems.outputFormatData.isEmpty
                                    ? print("Empty")
                                    : listviewitems.outputFormatData =
                                          listviewitems.inputFormatData
                                              .where(
                                                (item) =>
                                                    item['type'] == 'PDF' ||
                                                    item['type'] == 'IMG',
                                              )
                                              .toList();
                              } else if (selectedItem['type'] == 'IMG') {
                                listviewitems.outputFormatData.isEmpty
                                    ? print("Empty")
                                    : listviewitems.outputFormatData =
                                          listviewitems.inputFormatData
                                              .where(
                                                (item) =>
                                                    item['type'] == 'PDF' ||
                                                    item['type'] == 'Word',
                                              )
                                              .toList();
                              } else if (selectedItem['type'] == 'PPT') {
                                listviewitems.outputFormatData.isEmpty
                                    ? print("Empty")
                                    : listviewitems.outputFormatData =
                                          listviewitems.inputFormatData
                                              .where(
                                                (item) =>
                                                    item['type'] == 'PDF' ||
                                                    item['type'] == 'Word' ||
                                                    item['type'] == "IMG",
                                              )
                                              .toList();
                              } else if (selectedItem['type'] == 'Excel') {
                                listviewitems.outputFormatData = listviewitems
                                    .inputFormatData
                                    .where(
                                      (item) =>
                                          item['type'] == 'PDF' ||
                                          item['type'] == "IMG",
                                    )
                                    .toList();
                              } else
                                () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("No Found")),
                                  );
                                };
                            });
                          },
                        ),
                      ),
                    ),

                    SizedBox(width: 2.w),

                    Expanded(
                      flex: 2,

                      child: TextButton(
                        onPressed: isDisable
                            ? () async {
                                // for Image/File Pick

                                final XFile? photo = await imagePicker
                                    .pickImage(source: ImageSource.gallery);

                                if (photo == null) {
                                  print("No Image Selected");
                                  return;
                                }

                                final result = await textDetectorHelper
                                    .getRecognizedText(photo);

                                setState(() {
                                  file = photo;
                                  scannedText = result;
                                });

                                await showModalBottomSheet(
                                  context: context.mounted ? context : context,
                                  builder: (context) {
                                    return SizedBox(
                                      width: double.infinity,
                                      height: 20.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 2.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Your Input Image Text",
                                                  style: TextStyle(
                                                    fontSize: appsizer
                                                        .settingsTitleSize(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(5.w),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                width: 25.w,
                                                height: 10.h,
                                                child: file == null
                                                    ? Center(
                                                        child: Text(
                                                          "Image not Picked",
                                                          style: TextStyle(
                                                            fontSize: appsizer
                                                                .settingsDescSize(),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      )
                                                    : Padding(
                                                        padding: EdgeInsets.all(
                                                          1.w,
                                                        ),
                                                        child: Image.file(
                                                          File(file!.path),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                            : null,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.shade900,
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Import",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: AppWidgetSizer.greycolor,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            ImageIcon(
                              AssetImage("assets/image/import.png"),
                              color: AppWidgetSizer.greycolor,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2.h),

              /// Output Section
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Output",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: AppWidgetSizer.greycolor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: DropdownButton<Map<String, dynamic>>(
                    hint: Text(
                      "Select Output Format",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppWidgetSizer.greycolor,
                      ),
                    ),
                    isExpanded: true,
                    iconSize: 20.sp,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    underline: const SizedBox(),
                    value: outputCurrentItem,
                    items: listviewitems.outputFormatData
                        .map<DropdownMenuItem<Map<String, dynamic>>>((
                          Map<String, dynamic> value,
                        ) {
                          return DropdownMenuItem<Map<String, dynamic>>(
                            value: value,
                            child: Row(
                              children: [
                                Image.asset(value["icon"], scale: 4),
                                SizedBox(width: 3.w),
                                Text(
                                  value["title"],
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ],
                            ),
                          );
                        })
                        .toList(),
                    onChanged: isDisable
                        ? (Map<String, dynamic>? value) {
                            setState(() {
                              outputCurrentItem = value;
                            });
                          }
                        : null,
                  ),
                ),
              ),

              /// Convert Button
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 4.w),
                child: TextButton(
                  onPressed: isDisable
                      ? () {
                          // for convert Files

                          if (((inputCurrentItem?["title"] == "IMG'S") ||
                                  (inputCurrentItem?["icon"] ==
                                      "img_component.png")) &&
                              (outputCurrentItem?["title"] == "Excel File" ||
                                  (outputCurrentItem?["icon"] ==
                                      "excel_component.png"))) {
                            // image to excel
                            print("Converted Image to Excel");
                          } else if (inputCurrentItem?["title"] == "IMG'S" ||
                              (inputCurrentItem?["icon"] ==
                                      "img_component.png") &&
                                  outputCurrentItem?["title"] == "PDF File" ||
                              (outputCurrentItem?["icon"] == "pdf_component")) {
                            // convert here image to pdf
                            print("image to pdf");
                          } else if (inputCurrentItem?["title"] == "IMG'S" ||
                              (inputCurrentItem?["icon"] ==
                                      "img_component.png") &&
                                  outputCurrentItem?["title"] == "Word File" ||
                              (outputCurrentItem?["icon"] ==
                                  "word_component")) {
                            // image to Word
                            print("image to word");
                          } else {
                            // Default warning
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Please select valid input and output formats.",
                                  style: TextStyle(
                                    fontSize: appsizer.settingsDescSize(),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                duration: Duration(milliseconds: 2000),
                                backgroundColor: Colors.black,
                                action: SnackBarAction(
                                  label: "Ok",
                                  textColor: Colors.white,
                                  onPressed: () {
                                    ScaffoldMessenger.of(
                                      context,
                                    ).hideCurrentSnackBar();
                                  },
                                ),
                              ),
                            );
                          }
                        }
                      : null,

                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade900,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 1.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Convert",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: AppWidgetSizer.greycolor,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      const ImageIcon(
                        AssetImage("assets/image/convert_icon.png"),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(),

              /// Tools List
              Padding(
                padding: EdgeInsets.only(left: 4.w, top: 0.5.h),
                child: Text(
                  "Converter Tools",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppWidgetSizer.greycolor,
                    fontSize: appsizer.textsize(),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Future Tools",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppWidgetSizer.greycolor,
                    fontSize: 16.sp,
                  ),
                ),
              ),

              SizedBox(height: 1.h),

              SizedBox(
                width: double.infinity,
                height: 22.w,
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: listviewitems.featureToolsData.length * 25.w,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,

                      itemCount: listviewitems.featureToolsData.length,
                      itemBuilder: (context, index) {
                        final item = listviewitems.featureToolsData[index];
                        return InkWell(
                          onTap: () {
                            final Map<String, dynamic> selectedItem =
                                listviewitems.featureToolsData[index];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FuturetoolsScreen(
                                  selectedItem: selectedItem,
                                ),
                              ),
                            );
                            print(selectedItem);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: SizedBox(
                              width: 17.w,
                              height: 25.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(item["icon"], scale: 4),

                                  Text(
                                    item["title"],
                                    style: TextStyle(
                                      fontSize: _appWidgetSizer
                                          .settingsDescSize(),
                                      color: AppWidgetSizer.greycolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Future Tools",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppWidgetSizer.greycolor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: listviewitems.featureToolsData2.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final list = listviewitems.featureToolsData2[index];
                    return Column(
                      children: [
                        Image.asset(list["icon"], scale: 4),
                        Text(
                          list["title"],
                          style: TextStyle(
                            fontSize: _appWidgetSizer.settingsDescSize(),
                            color: AppWidgetSizer.greycolor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    mainAxisExtent: 11.h,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Other Tools",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppWidgetSizer.greycolor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listviewitems.othertoolsdata["icon"].length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        listviewitems.othertoolsdata["icon"][index],
                        Text(
                          listviewitems.othertoolsdata["Desc"][index],
                          style: TextStyle(
                            fontSize: _appWidgetSizer.settingsDescSize(),
                            color: AppWidgetSizer.greycolor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  mainAxisExtent: 10.h,
                ),
              ),

              // for testing Text Detector
              scannedText.isEmpty
                  ? const Text("Text Not Detected")
                  : SelectableText(scannedText),
            ],
          ),
        ),
      ),
    );
  }
}
