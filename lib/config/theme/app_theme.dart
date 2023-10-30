import 'package:flutter/material.dart';

const colorSeed = Colors.pink;

class AppTheme {

  ThemeData getTheme() => ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: colorSeed,
    useMaterial3: true,
  );
  
}