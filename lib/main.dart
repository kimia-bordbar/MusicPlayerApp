import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/screens/dashboard.dart';
import 'package:music_player/theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().lighTheme,
      // darkTheme: Themes().darkTheme,
      home: const Dashboard(),
    );
  }
}
