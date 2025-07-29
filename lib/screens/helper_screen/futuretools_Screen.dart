import 'package:all_example/helper/assets_strings.dart';
import 'package:all_example/themes/appwidget_themes.dart';
import 'package:all_example/themes/textsize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FuturetoolsScreen extends StatefulWidget {
  final Map<String, dynamic> selectedItem;
  const FuturetoolsScreen({super.key, required this.selectedItem});

  @override
  State<FuturetoolsScreen> createState() => _FuturetoolsScreenState();
}

class _FuturetoolsScreenState extends State<FuturetoolsScreen> {
  final AppWidgetSizer appsizer = AppWidgetSizer();

  @override
  Widget build(BuildContext context) {
    // app bar image
    Widget imageWidget;

    // app bar text
    Widget textWidget;

    // appbar image condition
    switch (widget.selectedItem['type']) {
      case 'PDF':
        imageWidget = Image.asset(pdfComponent, scale: 3);
        break;
      case 'TXT':
        imageWidget = Image.asset(textComponent, scale: 3);
        break;
      case 'IMG':
        imageWidget = Image.asset(imgComponent, scale: 3);
        break;
      default:
        imageWidget = const Icon(Icons.error, size: 60, color: Colors.red);
    }
    //  app bar text condition
    switch (widget.selectedItem['type']) {
      case 'PDF':
        textWidget = Container(
          margin: EdgeInsets.only(top: 1.h, left: 8.w),
          child: Text(
            "PDF Converter",
            style: GoogleFonts.inter(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        );
        break;
      case 'TXT':
        textWidget = Container(
          margin: EdgeInsets.only(top: 1.h, left: 8.w),
          child: Text(
            "Text Converter",
            style: GoogleFonts.inter(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        );
        break;
      case 'IMG':
        textWidget = Container(
          margin: EdgeInsets.only(top: 1.h, left: 8.w),
          child: Text(
            "Image Converter",
            style: GoogleFonts.inter(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        );
        break;
      default:
        textWidget = Text(
          "Not Found",
          style: GoogleFonts.inter(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        );
    }

    // image picker
    ImagePicker imagePicker = ImagePicker();

    // for Image Path
    List<XFile>? files;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,

        title: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  imageWidget,
                  SizedBox(width: 2.w),
                  Container(
                    decoration: BoxDecoration(
                      color: fileColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 4.h,
                    width: 50.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 2.w),
                          child: Text(
                            "Import File First",
                            style: GoogleFonts.inter(
                              fontSize: appsizer.settingsTitleSize(),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () async {
                            final List<XFile>? photos = await imagePicker
                                .pickMultiImage();

                            if (photos == null) {
                              print("No Image Selected");
                              return;
                            }

                            setState(() {
                              for (int i = 0; i < files!.length; i++) {
                                files = photos;
                              }
                            });
                            print(files);
                          },
                          icon: Icon(Icons.attach_file_rounded),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // textWidget,
              files != null ? LinearProgressIndicator() : SizedBox.shrink(),
            ],
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),

      body: Center(
        child: InkWell(
          onTap: () async {
            final List<XFile>? photos = await imagePicker.pickMultiImage();

            if (photos == null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("No Image Selected!")));
              return;
            }
            setState(() {
              files = photos;
            });
          },
          child: Container(
            width: double.infinity,
            color: fileColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(importFile),
                Text(
                  "Import File",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: importFileTxt,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
