import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

class Styles {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Montserrat',
      primaryColor: primaryColor,
      cardColor: Colors.white,
      canvasColor: Colors.grey[50],
      brightness: Brightness.light,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          foregroundColor: primaryColor,
          backgroundColor: primaryColor),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(primaryColor),
        side: MaterialStateBorderSide.resolveWith(
          (states) => const BorderSide(width: 1.0, color: Colors.black),
        ),
      ),
      expansionTileTheme:
          const ExpansionTileThemeData(collapsedIconColor: Colors.black),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: const ColorScheme.light(), buttonColor: primaryColor),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.black)),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
          .copyWith(brightness: Brightness.light)
          .copyWith(background: Colors.white)
          .copyWith(background: Colors.white),
    );
  }
}
