import 'package:all_example/themes/textsize.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  final AppWidgetSizer appsizer = AppWidgetSizer();
  bool isdark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/flash_icon.png',
              width: appsizer.appBarIconSize(),
              height: appsizer.appBarIconSize(),
            ),
            SizedBox(width: 1.w),
            Text(
              "Settings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: appsizer.appBarTextSize(),
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 4.h),
            child: Text(
              "SIGN UP WITH",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: appsizer.textsize(),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  radius: appsizer.loginCircleIconSize(),
                  backgroundColor: Colors.white,
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/4926/4926637.png",
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  radius: appsizer.loginCircleIconSize(),
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/2023_Facebook_icon.svg/600px-2023_Facebook_icon.svg.png",
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: appsizer.loginCircleIconSize(),
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/4443/4443113.png",
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5.w, left: 3.w),
            child: Text(
              "GENERAL SETTING",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: appsizer.textsize(),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.w),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.brightness_4,
                    size: appsizer.settingsIconSize(),
                  ),
                ),
              ),
              SizedBox(width: 1.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Theme",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: appsizer.settingsTitleSize(),
                    ),
                  ),

                  Text(
                    "Dark/Light",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: appsizer.settingsDescSize(),
                    ),
                  ),
                ],
              ),
              Spacer(),

              Switch(
                padding: EdgeInsets.only(right: 7.w),
                activeColor: const Color.fromARGB(255, 6, 129, 230),
                activeTrackColor: Color.fromARGB(255, 136, 133, 133),
                value: isdark,
                inactiveThumbColor: Color.fromARGB(255, 136, 133, 133),

                onChanged: (value) {
                  setState(() {
                    isdark = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 3.w),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.w),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.storage, size: appsizer.settingsIconSize()),
                ),
              ),
              SizedBox(width: 1.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Storage",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: appsizer.settingsTitleSize(),
                    ),
                  ),

                  Text(
                    "Size",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: appsizer.settingsDescSize(),
                    ),
                  ),
                ],
              ),
              Spacer(),

              TextButton(
                onPressed: () {},
                child: Text(
                  "Manage",
                  style: TextStyle(
                    fontSize: appsizer.settingsTitleSize(),
                    color: const Color.fromARGB(255, 6, 129, 230),
                  ),
                ),
              ),
            ],
          ),

          Divider(),

          Container(
            margin: EdgeInsets.only(top: 2.h, left: 3.w),
            child: Text(
              "OTHER DETAILS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: appsizer.textsize(),
              ),
            ),
          ),
          SizedBox(height: 3.w),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.w),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.warning_amber_rounded,
                    size: appsizer.settingsIconSize(),
                  ),
                ),
              ),
              SizedBox(width: 1.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Privacy & Policy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: appsizer.settingsTitleSize(),
                    ),
                  ),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Read",
                  style: TextStyle(
                    fontSize: appsizer.settingsTitleSize(),
                    color: const Color.fromARGB(255, 6, 129, 230),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3.w),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.w),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.question_mark_sharp,
                    size: appsizer.settingsIconSize(),
                  ),
                ),
              ),
              SizedBox(width: 1.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Privacy & Policy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: appsizer.settingsTitleSize(),
                    ),
                  ),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Read",
                  style: TextStyle(
                    fontSize: appsizer.settingsTitleSize(),
                    color: const Color.fromARGB(255, 6, 129, 230),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 3.w),
        ],
      ),
    );
  }
}
