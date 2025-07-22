import 'package:all_example/listviewItems/listviewItems.dart';
import 'package:all_example/themes/textsize.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Toolspage extends StatefulWidget {
  const Toolspage({super.key});

  @override
  State<Toolspage> createState() => _ToolspageState();
}

class _ToolspageState extends State<Toolspage> {
  final AppWidgetSizer appsizer = AppWidgetSizer();

  String? inputCurrentItem;
  String? outputCurrentItem;
  static const textcolor = Color.fromARGB(255, 136, 133, 133);

  Listviewitems listviewitems = Listviewitems();
  final AppWidgetSizer _appWidgetSizer = AppWidgetSizer();

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

            Text(
              "Converter",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: appsizer.appBarTextSize(),
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
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
                    color: textcolor,
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
                    color: textcolor,
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
                            style: TextStyle(color: textcolor, fontSize: 15.sp),
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
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.shade900,
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
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
                                color: textcolor,
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Icon(
                              Icons.download_outlined,
                              color: textcolor,
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
                    color: textcolor,
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
                      style: TextStyle(fontSize: 15.sp, color: textcolor),
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
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade900,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 1.8.h,
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
                        style: TextStyle(color: textcolor, fontSize: 16.sp),
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
                    color: textcolor,
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
                    color: textcolor,
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
                                    color: textcolor,
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
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Future Tools",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textcolor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              SizedBox(
                width: 100.w,
                height: 50.w,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 1.h,
                  ),
                  itemCount: listviewitems.featureToolsData2["icon"].length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 11.w,
                      height: 14.h,
                      child: Column(
                        children: [
                          listviewitems.featureToolsData2["icon"][index],
                          Text(listviewitems.featureToolsData2["Desc"][index]),
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
