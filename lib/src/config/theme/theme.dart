import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color.fromARGB(255, 250, 250, 250);

  static ThemeData theme = ThemeData(
    backgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: backgroundColor,
    ),
  );
}
