import 'package:flutter/material.dart';

class StylesSettings {
  static ThemeData LightTheme(BuildContext context){
    final theme = ThemeData.light();
    return theme.copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Color.fromARGB(252, 0, 253, 245)
      )
    );
  }

  static ThemeData DarkTheme(BuildContext context){
    final theme = ThemeData.dark();
    return theme.copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Color.fromARGB(251, 99, 99, 99)
      )
    );
  }

  static ThemeData CustomTheme(BuildContext context){
    final theme = ThemeData.dark();
    return theme.copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Color.fromARGB(250, 145, 117, 98)
      )
    );
  }
}