import 'package:flutter/material.dart';

// Méthode 1 : thème prédéfini
monThemeData1(BuildContext context, couleur) {
  MaterialColor mesCouleurs = couleur;
  ThemeData td = ThemeData(
      primarySwatch: mesCouleurs,
      //bottomAppBarColor: mesCouleurs[500],
      //secondaryHeaderColor: mesCouleurs[500],
      primaryColor: mesCouleurs[900],
      brightness: Brightness.light,
      //brightness: Brightness.dark,
      //primaryColorLight: mesCouleurs[500],
      // primaryColorDark: mesCouleurs[500],
      cardColor: mesCouleurs[200],
      fontFamily: 'Times New Roman',
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(
              205, 1, 51, 0.9), //Theme.of(context).colorScheme.secondary,
          letterSpacing: 3,
        ),
        displayMedium: TextStyle(
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          letterSpacing: 6,
          color: Theme.of(context).colorScheme.secondary, //Colors.white
        ),
        displaySmall: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
          color: Theme.of(context).primaryColor, //Colors.white
        ),
        bodyLarge: const TextStyle(
          fontSize: 15.0, fontFamily: 'times new roman', //color:Colors.black
          letterSpacing: 3,
        ),
        bodyMedium: const TextStyle(
          fontSize: 20.0,
          fontFamily: 'times new roman',
          color: Color.fromRGBO(205, 1, 51, 1.0),
        ),
      ));

  return td; //méthode 1
  // print('Le nombre est : $numCouleurBase');
  // print('La couleur est : ${nuances[100]}');
}

// Méthode2 : construire des nuances de la couleur choisie
// Méthode 3 : construire un shémas, définir  toutes les propriétés
