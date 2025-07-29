import 'package:all_example/helper/assets_strings.dart';
import 'package:all_example/listviewItems/listviewItems.dart';
import 'package:all_example/themes/appwidget_themes.dart';
import 'package:all_example/themes/textsize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final AppWidgetSizer appBar = AppWidgetSizer();
  Listviewitems listviewitems = Listviewitems();
  ImagePicker imagePicker = ImagePicker();

  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 3.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                appBarIcon,
                width: appBar.appBarIconSize(),
                height: appBar.appBarIconSize(),
              ),
              SizedBox(width: 1.w),
              Image.asset(appBarText, scale: 1),
            ],
          ),
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
            showModalBottomSheet(
              useSafeArea: true,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Container(
                      margin: EdgeInsets.only(left: 4.w),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/flash_icon.png',
                            width: appBar.appBarIconSize(),
                            height: appBar.appBarIconSize(),
                          ),
                          SizedBox(width: 1.w),
                          Text(
                            "Flash Cam",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: appBar.appBarTextSize(),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close, size: 7.w),
                    ),
                    actions: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.flash_on)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                    ],
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.camera_alt_outlined, size: 26.sp),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: drawerHeader),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [Image.asset(drawerIcon, scale: 10.sp)],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(
                        child: Text(
                          "Manager & Viewer",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
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
                        style: GoogleFonts.inter(
                          fontSize: appBar.settingsTitleSize(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.h),
              child: Image.asset(aiSiblinks, scale: 4.sp),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
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
                        style: GoogleFonts.inter(
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
                            useSafeArea: true,
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
                                  toolbarHeight: 7.h,
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
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
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
                                            fontSize: appBar
                                                .settingsTitleSize(),
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

              (listviewitems.homeRecentFilesList["icon"] as List).isEmpty &&
                      (listviewitems.homeRecentFilesList["Desc"] as List)
                          .isEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No Recent File!",
                          style: TextStyle(
                            fontSize: appBar.settingsTitleSize(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: 100.w,
                      height: 25.w,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth:
                                listviewitems
                                    .homeRecentFilesList["icon"]
                                    .length *
                                25.w,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,

                            itemCount: listviewitems
                                .homeRecentFilesList["icon"]
                                .length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: InkWell(
                                  onTap: () {
                                    // for testing
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        duration: Duration(milliseconds: 2000),
                                        backgroundColor: Colors.black,
                                        content: Text(
                                          "Clicked ${listviewitems.homeFolderList["title"][index]}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 17.w,

                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        listviewitems
                                            .homeRecentFilesList["icon"][index],

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
                  "Folders",
                  style: TextStyle(
                    fontSize: appBar.settingsTitleSize(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              SizedBox(
                width: double.infinity,
                height: 65.w,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1.w,

                    mainAxisExtent: 12.h,
                  ),
                  itemCount: listviewitems.homeFolderList["icon"].length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // for testing
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 2000),
                            backgroundColor: Colors.black,
                            content: Text(
                              "Clicked ${listviewitems.homeFolderList["title"][index]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          listviewitems.homeFolderList["icon"][index],
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
