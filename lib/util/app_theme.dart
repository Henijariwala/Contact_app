import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.black)
        )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )
    ),
    scaffoldBackgroundColor: Colors.white,
    popupMenuTheme: PopupMenuThemeData(
        color: Colors.white,
        labelTextStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black))
    )

);
ThemeData darkTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.black)
        )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white
    ),
    brightness: Brightness.dark,
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )
    ),
    scaffoldBackgroundColor: Colors.black12,
    popupMenuTheme: PopupMenuThemeData(
        labelTextStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black))
    )
);
CupertinoThemeData light = CupertinoThemeData(
  brightness: Brightness.light
);
CupertinoThemeData dark = CupertinoThemeData(
  brightness: Brightness.dark
);