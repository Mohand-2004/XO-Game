import 'package:flutter/material.dart';

// this class is used to encapsulate 2 colors in one object
class MyAppTheme{
  final Color basic;
  final Color transparent;
  MyAppTheme({required this.transparent,required this.basic});
}

// this class is used to collect the app MyAppThemes in one place
// each color MyAppTheme consistes of 2 colors 
class AppColor{
  // blue MyAppTheme
  static MyAppTheme blue = MyAppTheme(
    transparent: const Color.fromARGB(165, 0, 112, 192),
    basic: const Color(0xff0070C0)
  );

  // red MyAppTheme
  static MyAppTheme red = MyAppTheme(
    transparent: const Color.fromARGB(87, 255, 0, 0),
    basic: const Color(0xffff0000)
  );

  // grey MyAppTheme
  static MyAppTheme grey = MyAppTheme(
    transparent: const Color.fromARGB(190, 128, 128, 128),
    basic: const Color(0xff808080)
  );
}