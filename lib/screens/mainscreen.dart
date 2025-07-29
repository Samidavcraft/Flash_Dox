import 'package:all_example/helper/assets_strings.dart';
import 'package:all_example/screens/homepage.dart';
import 'package:all_example/screens/managerpage.dart';
import 'package:all_example/screens/settingspage.dart';
import 'package:all_example/screens/toolspage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(home)),
            label: "Home",

            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(tools)),
            label: "Tools",
            tooltip: "Tools",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(manager)),
            label: "Manager",
            tooltip: "Manager",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(settings)),
            label: "Settings",

            tooltip: "Settings",
          ),
        ],
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
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
