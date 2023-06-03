import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_cafe/provider/theme_provider';
import 'package:proyecto_cafe/screens/home_screen.dart';

class ThemeConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Selección de Tema'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                themeProvider.setTheme(AppTheme.Light);
              },
              child: Text('Tema de Día'),
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                themeProvider.setTheme(AppTheme.Dark);
              },
              child: Text('Tema de Noche'),
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                themeProvider.setTheme(AppTheme.Custom);
              },
              child: Text('Tema Personalizado'),
            ),
            SizedBox(height: 40),
            FilledButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
