import 'package:all_example/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          home: Mainscreen(),
          theme: ThemeData(brightness: Brightness.dark),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
