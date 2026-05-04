import 'package:flutter/material.dart';

ThemeData monThemeData1(BuildContext context, Color couleur) {
  // Création du ColorScheme Material 3 à partir de la couleur source
  final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: couleur,
    primary: couleur,
    secondary: const Color.fromRGBO(205, 1, 51, 1.0),
    brightness: Brightness.light,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    fontFamily: 'Times New Roman',
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primaryContainer,
      foregroundColor: colorScheme.onPrimaryContainer,
      centerTitle: true,
      elevation: 0,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicatorColor: colorScheme.primary,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: colorScheme.secondary,
        letterSpacing: 3,
      ),
      displayMedium: TextStyle(
        fontSize: 20.0,
        fontStyle: FontStyle.italic,
        letterSpacing: 6,
        color: colorScheme.secondary,
      ),
      displaySmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
        color: colorScheme.primary,
      ),
      bodyLarge: const TextStyle(
        fontSize: 15.0,
        fontFamily: 'Times New Roman',
        letterSpacing: 3,
      ),
      bodyMedium: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Times New Roman',
        color: colorScheme.secondary,
      ),
    ),
  );
}
