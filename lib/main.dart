import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter_app/widgets/expenses.dart';

var kSeedColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
var kDarkSeedColor = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(MaterialApp(
    themeMode: ThemeMode.system,
    darkTheme: ThemeData.dark().copyWith(colorScheme: kDarkSeedColor),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kSeedColor,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kSeedColor.onPrimaryContainer,
        foregroundColor: kSeedColor.primaryContainer,
        centerTitle: true,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kSeedColor.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kSeedColor.primaryContainer),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kSeedColor.onSecondaryContainer,
            ),
          ),
    ),
    home: const Expenses(),
  ));
}
