import 'package:flutter/material.dart';

class AppTheme {
  get seedColor => Colors.deepPurple;

  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      listTileTheme: const ListTileThemeData(iconColor: Colors.deepPurple)
    );
  }
}