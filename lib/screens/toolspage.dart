import 'dart:io';

import 'package:all_example/listviewItems/listviewItems.dart';
import 'package:all_example/model/excel.dart';
import 'package:all_example/themes/textsize.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
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
  String? inputCurrentItem;
  // output DropdownButton
  String? outputCurrentItem;

  // listview for DropDownButton and Future ListView
  Listviewitems listviewitems = Listviewitems();
  // for Icon Size and Text Font Size
  final AppWidgetSizer _appWidgetSizer = AppWidgetSizer();

  // for Image Picker
  ImagePicker imagePicker = ImagePicker();

  // for path
  XFile? file;

  // for Text Detector
  final textRecognizer = GoogleMlKit.vision.textRecognizer();

  // excel convertor
  ExcelConverter excelConverter = ExcelConverter();

  Future<RecognizedText?> recognizeTextFromFile() async {
    if (file == null) return null;
    final inputImage = InputImage.fromFile(File(file!.path));
    final recognisedText = await textRecognizer.processImage(inputImage);
    await textRecognizer.close(); // Close after use
    return recognisedText;
  }

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
                'assets/flash_icon.png',
                width: appsizer.appBarIconSize(),
                height: appsizer.appBarIconSize(),
              ),
              SizedBox(width: 1.w),
              Text(
                "Converter",
                style: TextStyle(
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
                        child: DropdownButton<String>(
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
                              .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                );
                              })
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              inputCurrentItem = value!;
                            });
                          },
                        ),
                      ),
                    ),

                    SizedBox(width: 2.w),

                    Expanded(
                      flex: 2,

                      child: TextButton(
                        onPressed: () async {
                          // for Image/File Pick

                          final XFile? photo = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                          );
                          setState(() {
                            file = photo;
                          });
                          print("Image is picked");

                          if (inputCurrentItem == "IMG'S" &&
                              outputCurrentItem == "Excel File") {
                            final inputImage = InputImage.fromFile(
                              File(file!.path),
                            );
                            final recognizedText = await textRecognizer
                                .processImage(inputImage);
                            await textRecognizer.close();

                            if (recognizedText.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("⚠️ No text found in image"),
                                ),
                              );
                              return;
                            }

                            await excelConverter.convertTextToExcel(
                              recognizedText.text,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("✅ Image converted to Excel"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "⚠️ Please select valid input/output",
                                ),
                              ),
                            );
                          }

                          // await showModalBottomSheet(
                          //   context: context.mounted ? context : context,
                          //   builder: (context) {
                          //     return SizedBox(
                          //       width: double.infinity,
                          //       height: 20.h,
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,

                          //         children: [
                          //           Container(
                          //             margin: EdgeInsets.all(5.w),
                          //             decoration: BoxDecoration(
                          //               color: Colors.grey,
                          //               borderRadius: BorderRadius.circular(15),
                          //             ),
                          //             width: 25.w,
                          //             height: 10.h,
                          //             child: file == null
                          //                 ? Center(
                          //                     child: Text(
                          //                       "Image not Picked",
                          //                       style: TextStyle(
                          //                         fontSize: appsizer
                          //                             .settingsDescSize(),
                          //                         fontWeight: FontWeight.bold,
                          //                       ),
                          //                     ),
                          //                   )
                          //                 : Padding(
                          //                     padding: EdgeInsets.all(1.w),
                          //                     child: Image.file(
                          //                       File(file!.path),
                          //                       fit: BoxFit.cover,
                          //                     ),
                          //                   ),
                          //           ),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // );
                        },
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
                              style: TextStyle(
                                color: AppWidgetSizer.greycolor,
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Icon(
                              Icons.download_outlined,
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
                  child: DropdownButton<String>(
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
                        .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          );
                        })
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        outputCurrentItem = value!;
                      });
                    },
                  ),
                ),
              ),

              /// Convert Button
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 4.w),
                child: TextButton(
                  onPressed: () async {
                    if (file == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("⚠️ Please pick an image first"),
                        ),
                      );
                      return;
                    }

                    if (inputCurrentItem == "Image" &&
                        outputCurrentItem == "Excel") {
                      // Step 1: OCR
                      final recognizedText = await recognizeTextFromFile();
                      if (recognizedText == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("❌ Failed to recognize text"),
                          ),
                        );
                        return;
                      }

                      // Step 2: Save to Excel
                      await excelConverter.convertTextToExcel(
                        recognizedText.text,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("⚠️ Conversion not supported yet"),
                        ),
                      );
                    }
                  },

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
                        style: TextStyle(
                          color: AppWidgetSizer.greycolor,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      const Icon(
                        Icons.change_circle_rounded,
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
                width: 100.w,
                height: 25.w,
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth:
                          listviewitems.featureToolsData["icon"].length * 25.w,
                    ),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,

                      itemCount: listviewitems.featureToolsData["icon"].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: SizedBox(
                            width: 17.w,
                            height: 25.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                listviewitems.featureToolsData["icon"][index],

                                Text(
                                  listviewitems.featureToolsData["Desc"][index],
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
                width: double.infinity,
                height: 50.w,
                child: GridView.builder(
                  itemCount: listviewitems.featureToolsData2["icon"].length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: SizedBox(
                        width: 12.w,
                        height: 25.h,
                        child: Column(
                          children: [
                            listviewitems.featureToolsData2["icon"][index],
                            Text(
                              listviewitems.featureToolsData2["Desc"][index],
                              style: TextStyle(
                                fontSize: _appWidgetSizer.settingsDescSize(),
                                color: AppWidgetSizer.greycolor,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,

                    mainAxisExtent: 10.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
