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
    );
  }
}
