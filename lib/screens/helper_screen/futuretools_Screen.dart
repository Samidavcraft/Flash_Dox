import 'package:all_example/themes/textsize.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FuturetoolsScreen extends StatefulWidget {
  const FuturetoolsScreen({super.key});

  @override
  State<FuturetoolsScreen> createState() => _FuturetoolsScreenState();
}

class _FuturetoolsScreenState extends State<FuturetoolsScreen> {
  final AppWidgetSizer appsizer = AppWidgetSizer();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> selectedItem =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    //
    Widget imageWidget;
    Widget textWidget;
    switch (selectedItem['type']) {
      case 'PDF':
        imageWidget = Image.asset('assets/pdf_component.png', scale: 3);
        break;
      case 'TXT':
        imageWidget = Image.asset('assets/text_component.png', scale: 3);
        break;
      case 'IMG':
        imageWidget = Image.asset('assets/img_component.png', scale: 3);
        break;
      default:
        imageWidget = const Icon(Icons.error, size: 60, color: Colors.red);
    }

    switch (selectedItem['type']) {
      case 'PDF':
        textWidget = Text(
          "PDF Converter",
          style: TextStyle(
            fontSize: appsizer.settingsDescSize(),
            fontWeight: FontWeight.bold,
          ),
        );
        break;
      case 'TXT':
        textWidget = Text(
          "Text Converter",
          style: TextStyle(
            fontSize: appsizer.settingsDescSize(),
            fontWeight: FontWeight.bold,
          ),
        );
        break;
      case 'IMG':
        textWidget = Text(
          "Image Converter",
          style: TextStyle(
            fontSize: appsizer.settingsDescSize(),
            fontWeight: FontWeight.bold,
          ),
        );
        break;
      default:
        textWidget = Text(
          "Not Found",
          style: TextStyle(
            fontSize: appsizer.settingsDescSize(),
            fontWeight: FontWeight.bold,
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 12.h,
        title: Container(
          margin: EdgeInsets.only(top: 2.h),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  imageWidget,
                  SizedBox(width: 2.w),

                  Column(
                    children: [
                      SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 109, 109, 107),
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
                                  style: TextStyle(
                                    fontSize: appsizer.settingsTitleSize(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.attach_file_rounded),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              textWidget,
            ],
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),

      // ✅ Optional: Also show the image in the body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageWidget,
            SizedBox(height: 2.h),
            Text(
              'You selected: ${selectedItem["title"]}',
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
