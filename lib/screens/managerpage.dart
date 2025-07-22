import 'package:all_example/themes/textsize.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Managerpage extends StatefulWidget {
  const Managerpage({super.key});

  @override
  State<Managerpage> createState() => _ManagerpageState();
}

class _ManagerpageState extends State<Managerpage> {
  final AppWidgetSizer appsizer = AppWidgetSizer();
  Map<String, dynamic> tabsItems = {
    "texts": ["Home", "Settings", "Example"],
    "icons": [Icon(Icons.home), Icon(Icons.settings), Icon(Icons.abc)],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsItems.length,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new_sharp),

          title: Row(
            children: [
              Image.asset(
                'assets/flash_icon.png',
                width: appsizer.appBarIconSize(),
                height: appsizer.appBarIconSize(),
              ),
              SizedBox(width: 1.w),
              Text(
                "Manager",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: appsizer.appBarTextSize(),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            dividerHeight: 0.1,

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
