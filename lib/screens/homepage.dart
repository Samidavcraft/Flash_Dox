import 'package:all_example/listviewItems/listviewItems.dart';
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
  Listviewitems listviewitems = Listviewitems();

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
            SizedBox(width: 1.w),
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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: IconButton(
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
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Manager & Viewer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: appBar.settingsTitleSize(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: listviewitems.drawerItems["icon"].length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // for Test
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 2000),
                          backgroundColor: Colors.black,
                          content: Text(
                            "Clicked ${listviewitems.drawerItems["title"][index]}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: listviewitems.drawerItems["icon"][index],
                      title: Text(
                        listviewitems.drawerItems["title"][index],
                        style: TextStyle(fontSize: appBar.settingsTitleSize()),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 3.w, right: 5.w),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 2.w),
                    child: Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadiusGeometry.zero,
                          ),
                          context: (context),
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                leading: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.close),
                                ),
                                toolbarHeight: 10.h,
                                title: SizedBox(
                                  height: 4.h,
                                  width: double.infinity,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize: appBar.settingsTitleSize(),
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      fillColor: Colors.grey,
                                      contentPadding: EdgeInsets.only(
                                        top: 1.h,
                                        left: 2.w,
                                      ),
                                      filled: true,
                                      hint: Text(
                                        "Search Here",
                                        style: TextStyle(
                                          fontSize: appBar.settingsTitleSize(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                actions: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                              ),
                              body: Column(
                                children: [
                                  Divider(height: 1.h),

                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: listviewitems
                                          .searchviewData["icon"]
                                          .length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            // for Testing
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                duration: Duration(
                                                  milliseconds: 2000,
                                                ),
                                                backgroundColor: Colors.black,
                                                content: Text(
                                                  "Clicked ${listviewitems.searchviewData["Title"][index]}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: ListTile(
                                            leading: listviewitems
                                                .searchviewData["icon"][index],
                                            title: Text(
                                              listviewitems
                                                  .searchviewData["Title"][index],
                                            ),
                                            subtitle: Text(
                                              listviewitems
                                                  .searchviewData["Desc"][index],
                                            ),
                                            trailing: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.more_vert),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppWidgetSizer.greycolor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Row(
                            children: [
                              Text(
                                "Search Here",
                                style: TextStyle(
                                  fontSize: appBar.settingsTitleSize(),
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.search),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 3.h),
            Container(
              margin: EdgeInsets.only(left: 5.w),
              child: Text(
                "Recent Files",
                style: TextStyle(
                  fontSize: appBar.settingsTitleSize(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // below Widget for Testing UI
            SizedBox(height: 2.h),
            SizedBox(
              width: 100.w,
              height: 25.w,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth:
                        listviewitems.homeRecentFilesList["icon"].length * 25.w,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: listviewitems.homeRecentFilesList["icon"].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: SizedBox(
                          width: 17.w,
                          height: 25.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              listviewitems.homeRecentFilesList["icon"][index],

                              Text(
                                listviewitems
                                    .homeRecentFilesList["Desc"][index],
                                style: TextStyle(
                                  fontSize: appBar.settingsDescSize(),
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
            Divider(height: 1.h),
            Container(
              margin: EdgeInsets.only(left: 5.w, top: 1.h),
              child: Text(
                "Folder",
                style: TextStyle(
                  fontSize: appBar.settingsTitleSize(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 1.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: GridView.builder(
                itemCount: listviewitems.homeFolderList["icon"].length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: SizedBox(
                      width: 12.w,
                      height: 25.h,
                      child: GridTile(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            listviewitems.homeFolderList["icon"][index],
                            SizedBox(height: 1.h),
                            Text(
                              listviewitems.homeFolderList["title"][index],
                              style: TextStyle(
                                fontSize: appBar.settingsDescSize(),
                                color: AppWidgetSizer.greycolor,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              listviewitems.homeFolderList["desc"][index],
                              style: TextStyle(
                                fontSize: appBar.settingsDescSize(),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,

                  mainAxisExtent: 10.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
