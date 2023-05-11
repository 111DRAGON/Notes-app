import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_app/screens/home%20page.dart';
import 'package:notes_app/theme/theme%20services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage() ,
      theme: Themes.lightTheme,
      darkTheme:Themes.darkTheme,
      themeMode: ThemeService().mode,
    );
  }
}
