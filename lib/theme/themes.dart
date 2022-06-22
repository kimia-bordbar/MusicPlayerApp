import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  ThemeData lighTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.white,
      primary: Colors.black,
    ),
    appBarTheme:  AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 8.0,
      shadowColor: Colors.white30,
      scrolledUnderElevation: 3.0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.acme(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme:  TextTheme(
      headline6: GoogleFonts.sourceSansPro(
        fontSize: 20.0,
        color: Colors.white,
        fontStyle: FontStyle.italic,
      ),
      headline5: GoogleFonts.sourceSansPro(
        fontSize: 16.0,
        color: Colors.white,
        // fontStyle: FontStyle.italic,
      ),
      headline4: GoogleFonts.sourceSansPro(
        fontSize: 12.0,
        color: Colors.white,
        // fontStyle: FontStyle.italic,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 8.0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      backgroundColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );

  // ThemeData darkTheme = ThemeData.light().copyWith(
  //   scaffoldBackgroundColor: Colors.white,
  //   colorScheme: ColorScheme.fromSwatch().copyWith(
  //     secondary: Colors.deepPurple[100],
  //     primary: Colors.deepPurple,
  //   ),
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: Colors.deepPurple,
  //     centerTitle: true,
  //     titleTextStyle: TextStyle(
  //       // fontFamily: '',
  //       fontSize: 20,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //     elevation: 8.0,
  //     selectedItemColor: Colors.black,
  //     unselectedItemColor: Color.fromARGB(255, 66, 66, 66),
  //     backgroundColor: Colors.white,
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: TextButton.styleFrom(
  //       primary: Colors.white,
  //       backgroundColor: Colors.black,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //     ),
  //   ),
  // );
}
