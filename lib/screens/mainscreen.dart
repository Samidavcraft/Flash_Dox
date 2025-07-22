import 'package:all_example/screens/homepage.dart';
import 'package:all_example/screens/managerpage.dart';
import 'package:all_example/screens/settingspage.dart';
import 'package:all_example/screens/toolspage.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int currentItem = 0;

  PageController pageController = PageController();

  void tapped(int index) {
    setState(() {
      currentItem = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentItem,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: "Tools",
            tooltip: "Tools",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_file_move_rtl_outlined),
            label: "Manager",
            tooltip: "Manager",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
            tooltip: "Settings",
          ),
        ],
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,

        elevation: 4,
        iconSize: 22.sp,
        onTap: tapped,
        unselectedItemColor: const Color.fromARGB(255, 114, 113, 113),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [Homepage(), Toolspage(), Managerpage(), Settingspage()],
      ),
    );
  }
}
