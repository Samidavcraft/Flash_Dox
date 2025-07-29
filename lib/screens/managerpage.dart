import 'package:all_example/helper/assets_strings.dart';
import 'package:all_example/listviewItems/listviewItems.dart';
import 'package:all_example/themes/textsize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Managerpage extends StatefulWidget {
  const Managerpage({super.key});

  @override
  State<Managerpage> createState() => _ManagerpageState();
}

class _ManagerpageState extends State<Managerpage> {
  final AppWidgetSizer appsizer = AppWidgetSizer();
  Listviewitems listviewitems = Listviewitems();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
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
                  "Manager",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: appsizer.appBarTextSize(),
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            dividerHeight: 0.1,
            labelStyle: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            isScrollable: true,
            tabs: [
              Tab(text: "Recent"),
              Tab(text: "Scanned"),
              Tab(text: "Word"),
              Tab(text: "PDF"),
              Tab(text: "Excel"),
              Tab(text: "PPT"),
              Tab(text: "Favourite"),
              Tab(text: "All"),

              Tab(text: "Trash"),
            ],
          ),
        ),
      ),
    );
  }
}
