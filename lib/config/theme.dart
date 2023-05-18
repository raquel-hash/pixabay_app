import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData theme() => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blueGrey,
          toolbarTextStyle: TextStyle(
            color: Colors.blueGrey,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
