import 'package:flutter/material.dart';
import 'package:proyecto_cafe/screens/login_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
        return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bienvenido Administrador',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          OptionItem(
            icon: Icons.add_box,
            title: 'Añadir',
            onTap: () {
              // Acción para la opción 1
              
            },
          ),
          Divider(),
          OptionItem(
            icon: Icons.edit,
            title: 'Editar',
            onTap: () {
              // Acción para la opción 2
             
            },
          ),
          Divider(),
          OptionItem(
            icon: Icons.delete_forever,
            title: 'Eliminar',
            onTap: () {
              // Acción para la opción 3
              
            },
          ),
          Divider(),
          OptionItem(
            icon: Icons.person,
            title: 'Cerrar Sesion',
            onTap: () {
              // Acción para la opción 4
              
            },
          ),
        ],
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const OptionItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 16.0),
            Text(title),
          ],
        ),
      ),
    );
  } 
}

