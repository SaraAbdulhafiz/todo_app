import 'package:flutter/material.dart';
import 'package:todo_app/shared/styles/colors.dart';


class MyThemeData {

  static ThemeData lightTheme = ThemeData(

    iconTheme: IconThemeData(color: primary),
    scaffoldBackgroundColor: mintGreen,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      unselectedItemColor: Colors.grey,
      selectedItemColor:primary,
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
