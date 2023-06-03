import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _selectedImage;

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _registerUser() async {
    final String name = _nameController.text.trim();
    final String lastName = _lastNameController.text.trim();
    final String city = _cityController.text.trim();
    final String state = _stateController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Guardar imagen en Firebase Storage
    String imageUrl = '';
    if (_selectedImage != null) {
      firebase_storage.Reference storageReference = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      firebase_storage.UploadTask uploadTask = storageReference.putFile(_selectedImage!);
      await uploadTask.whenComplete(() async {
        imageUrl = await storageReference.getDownloadURL();
      });
    }

    // Guardar los datos en Firebase Firestore
    FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'lastName': lastName,
      'city': city,
      'state': state,
      'email': email,
      'imageUrl': imageUrl,
    }).then((value) {
      // Registro exitoso, navegar a la pantalla principal
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (route) => false,
      );
    }).catchError((error) {
      // Error al registrar al usuario
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Ocurrió un error al registrar al usuario.'),
            actions: [
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/fondo.jpg'), // Cambiar por tu propia imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _selectImage();
              },
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
                child: _selectedImage == null ? Icon(Icons.camera_alt, size: 40.0) : null,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Nombre',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                hintText: 'Apellidos',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: 'Ciudad',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _stateController,
              decoration: InputDecoration(
                hintText: 'Estado',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            FilledButton(
              child: Text('Registrarme'),
              onPressed: () {
                _registerUser();
              },
            ),
          ],
        ),
      ),
    )
    );
  }
}
