import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_cafe/provider/theme_provider';
import 'package:proyecto_cafe/screens/login_screen.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
  final ThemeProvider themeProvider = ThemeProvider();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final currentTheme = Theme.of(context);
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => themeProvider,
      builder: (context, _) {
        themeProvider.initializeTheme();
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) {
            return MaterialApp(
              title: 'Mi Aplicación',
              theme: themeProvider.currentTheme,
              home: const LoginScreen(),
            );
          },
        );
      },
    );
  }
}

