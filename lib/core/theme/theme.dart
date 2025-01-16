import 'package:client/core/theme/color.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static final dartThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme:const InputDecorationTheme(
      contentPadding: EdgeInsets.all(30),
      enabledBorder:OutlineInputBorder(
        borderSide: BorderSide(
          color: Pallete.borderColor,
          width: 3,
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Pallete.gradient2,
          width: 3,
        )
      ),
      
    )

  );
}