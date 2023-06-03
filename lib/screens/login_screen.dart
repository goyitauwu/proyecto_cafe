import 'package:flutter/material.dart';
import 'package:proyecto_cafe/screens/home_screen.dart';
import 'package:proyecto_cafe/screens/register_screen.dart';
import 'package:custom_signin_buttons/custom_signin_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Iniciar sesión'),
      ), */
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo2.jpg'),
            opacity: 0.65, 
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
              ),
            ),
            SizedBox(height: 20.0),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            CustomSignInButton(
              text: 'Sign In With Email',
              customIcon: Icons.email,
              buttonColor: Colors.blue,
              iconColor: Colors.white,
              textColor: Colors.white,
              width: 200,
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            SizedBox(height: 20.0),
             const Text(
              'Iniciar sesión con:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  button: Button.Google,
                  mini: true,
                  borderRadius: 50,
                  onPressed: () {
                    // Lógica de inicio de sesión con Google
                  },
                ),
                SizedBox(width: 20.0),
                SignInButton(
                  button: Button.Facebook,
                  mini: true,
                  borderRadius: 50,
                  onPressed: () {
                    // Lógica de inicio de sesión con Facebook
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: const Text(
                '¿No tienes una cuenta? Regístrate aquí',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                
              },
              child: const Text(
                'Olvide mi contraseña',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
      )
    );
  }
}

