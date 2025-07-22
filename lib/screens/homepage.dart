import 'package:all_example/themes/textsize.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final AppWidgetSizer appBar = AppWidgetSizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/flash_icon.png',
              width: appBar.appBarIconSize(),
              height: appBar.appBarIconSize(),
            ),

            Text(
              "Flash Dox",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: appBar.appBarTextSize(),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: IconButton(
        padding: EdgeInsets.only(right: 3.w, bottom: 2.h),
        color: Colors.white,
        tooltip: "Camera",
        onPressed: () {
          // Camera Module
          /*
                  Take Images...
          */
        },
        icon: Icon(Icons.camera_alt_outlined, size: 26.sp),
      ),
    );
  }
}
