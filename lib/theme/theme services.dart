import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_app/wedigets/custom_app_bar.dart';

class ThemeService {
  String key = 'isDarkTheme';
  GetStorage box = GetStorage();
  update(bool isDarkTheme) => box.write(key, isDarkTheme);
  read() => box.read<bool>(key) ?? false;
  ThemeMode get mode => read() ? ThemeMode.dark : ThemeMode.light;
  switchTheme() {
    Get.changeThemeMode(read() ? ThemeMode.light : ThemeMode.dark);
    update(!read());
  }
}

class Themes {
  //static Color color = Get.isDarkMode? const Color.fromRGBO(87, 98, 98, 1.0):const Color.fromRGBO(174, 202, 201, 1.0);
  static ThemeData lightTheme = ThemeData(
      accentColor: Colors.white,
      canvasColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[50],

      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(38, 104, 139, 1.0), elevation: 0.0),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromRGBO(146, 184, 190, 1.0),
        elevation: 0.0,
      ),
      fontFamily: "Lora",
      brightness: Brightness.light);

  static ThemeData darkTheme = ThemeData(
    accentColor: const Color.fromRGBO(49, 49, 49, 1),
    fontFamily: "Lora",
    canvasColor: Colors.white,
    primaryColor: const Color.fromRGBO(3, 47, 47, 0.8862745098039215),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 5.0,
        backgroundColor: Colors.white10),
    brightness: Brightness.dark,
    scaffoldBackgroundColor:
        const Color.fromRGBO(3, 47, 47, 0.8862745098039215),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromRGBO(3, 47, 47, 0.8862745098039215),
      elevation: 0.0,
    ),
  );
}
